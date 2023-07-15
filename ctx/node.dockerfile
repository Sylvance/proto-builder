# Use a base image with Protobuf pre-installed
FROM node:lts-bullseye-slim

# Install Protobuf and other required tools
RUN apt-get update && apt-get install -y protobuf-compiler cmake

RUN npm install -g grpc-tools

# Set the working directory
WORKDIR /app

COPY . .

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app

USER appuser

CMD ["make", "proto", "language=node"]
