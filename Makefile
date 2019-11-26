DOCKER_ORG:=alpine
DOCKER_IMAGE:=synapse

build: package
	docker build -t $(DOCKER_ORG)/$(DOCKER_IMAGE) .

.PHONY: package
