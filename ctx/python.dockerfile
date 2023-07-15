# Use a base image with Protobuf pre-installed
FROM python:3.10-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install Protobuf and other required tools
RUN apt-get update && apt-get install -y protobuf-compiler cmake

RUN python -m pip install grpcio

RUN python -m pip install grpcio-tools

# Set the working directory
WORKDIR /app

COPY . .

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app

USER appuser

CMD ["make", "proto", "language=python"]
