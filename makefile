# Makefile for managing MongoDB Docker container

# Container name
CONTAINER_NAME=mongodb

# MongoDB Docker image
IMAGE=mongo:latest

# Docker network (optional)

# Docker volume (optional)
VOLUME=mongodb_volume

# Port mapping
PORT=27017:27017

.PHONY: start stop create remove

# Create network and volume
setup:
	docker volume create $(VOLUME) || true
# Create MongoDB container
create: setup
	docker run --name $(CONTAINER_NAME) \
		--volume $(VOLUME):/data/db \
		-p $(PORT) \
		-d $(IMAGE)

# Start MongoDB container
start:
	docker start $(CONTAINER_NAME)

# Stop MongoDB container
stop:
	docker stop $(CONTAINER_NAME)

# Remove MongoDB container
remove: stop
	docker rm $(CONTAINER_NAME)

# Inspect MongoDB container logs
logs:
	docker logs $(CONTAINER_NAME)

# Status of MongoDB container
status:
	docker ps -a --filter "name=$(CONTAINER_NAME)"