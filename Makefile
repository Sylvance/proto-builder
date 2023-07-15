SHELL := /bin/bash

DOCKERFILES := $(wildcard ctx/*.dockerfile)
IMAGE_NAMES := $(patsubst ctx/%.dockerfile,%,$(DOCKERFILES))
IMAGE_VERSION := $(shell cat .image-version)
PROTOS := $(wildcard protos/*.proto)

define docker_run
	docker run -it -v ${PWD}:/app proto-builder-${1}:${IMAGE_VERSION}
endef

define docker_shell
	docker run -it -v ${PWD}:/app proto-builder-${1}:${IMAGE_VERSION} ${SHELL}
endef

define proto_go
	for proto in $(PROTOS); do \
		protoc --go_out=./lib/go --go-grpc_out=./lib/go --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative $$proto; \
	done
endef

define proto_ruby
	for proto in $(PROTOS); do \
		grpc_tools_ruby_protoc -I ../protos --ruby_out=lib/ruby --grpc_out=lib/ruby $$proto; \
	done
endef

define proto_node
	for proto in $(PROTOS); do \
		grpc_tools_node_protoc --js_out=import_style=commonjs,binary:lib/node --grpc_out=grpc_js:lib/node $$proto; \
	done
endef

define proto_java
	for proto in $(PROTOS); do \
		protoc --plugin=protoc-gen-grpc-java --grpc-java_out=lib/java --proto_path=protos $$proto; \
	done
endef

define proto_python
	for proto in $(PROTOS); do \
		python -m grpc_tools.protoc -I./protos --python_out=lib/python --pyi_out=lib/python --grpc_python_out=lib/python $$proto; \
	done
endef

define perform_build
	docker build -t proto-builder-${1}:${IMAGE_VERSION} -f ${2} .
endef

define perform_docker_action
	[[ $(1) == "run" ]] && $(call docker_run,$(2)) || echo "Actions: run, shell."
	[[ $(1) == "shell" ]] && $(call docker_shell,$(2)) || echo "Actions: run, shell."
endef

PHONY: build-all
build-all: $(IMAGE_NAMES)
$(IMAGE_NAMES): %: ctx/%.dockerfile
	@$(call perform_build,$@,$<)

.PHONY: docker
docker:
	@$(call perform_docker_action,$(action),$(language))

.PHONY: proto
proto:
ifeq ($(language),go)
	$(call proto_go)
endif

ifeq ($(language),ruby)
	$(call proto_ruby)
endif

ifeq ($(language),node)
	$(call proto_node)
endif

ifeq ($(language),java)
	$(call proto_java)
endif

ifeq ($(language),python)
	$(call proto_python)
endif
