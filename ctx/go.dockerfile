# Use a base image with Protobuf pre-installed
FROM golang:1.16-buster

# Install Protobuf and other required tools
RUN apt-get update && apt-get install -y protobuf-compiler

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28

RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

# Set the working directory
WORKDIR /app

COPY . .

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app

USER appuser

CMD ["make", "proto", "language=go"]
