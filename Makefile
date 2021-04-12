REGISTRY ?= quay.io
DEFAULT_TAG = latest
DOCKERFILE := Dockerfile
REPOSITORY ?= openshiftio/fabric8-analytics-bigquery-manifests-job

.PHONY: all docker-build fast-docker-build test get-image-name get-image-repository get-push-registry

all: fast-docker-build

docker-build:
	docker build --no-cache -t $(REGISTRY)/$(REPOSITORY):$(DEFAULT_TAG) -f $(DOCKERFILE) .
	@echo $(REGISTRY)/$(REPOSITORY):$(DEFAULT_TAG)

fast-docker-build:
	docker build -t $(REGISTRY)/$(REPOSITORY):$(DEFAULT_TAG) -f $(DOCKERFILE) .
	@echo $(REGISTRY)/$(REPOSITORY):$(DEFAULT_TAG)

test:
	./runtest.sh

get-image-name:
	@echo $(REGISTRY)/$(REPOSITORY):$(DEFAULT_TAG)

get-image-repository:
	@echo $(REPOSITORY)

get-push-registry:
	@echo $(REGISTRY)
