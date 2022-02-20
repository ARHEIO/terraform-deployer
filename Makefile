# -----------------------------------
# MAKEFILE VARS
# -----------------------------------

.DEFAULT_GOAL := help

IMAGE = ghcr.io/arheio/terraform-deployer

GITHUB_TOKEN ?=
CURRENT_TAG := $(shell git describe --tags --abbrev=0)
NEW_TAG := $(shell echo $$CURRENT_TAG | awk 'BEGIN {FS = "\."}; {printf "1.%s.0\n", $$2+1}')

.PHONY: init plan planAuto apply applyAuto destroy .env .debug

# -----------------------------------
# MAKE TARGETS
# -----------------------------------

version: ## Prints the versions
	@echo "The current tag is: $(CURRENT_TAG)"
	@echo "The next tag is: $(NEW_TAG)"
	git tag -a $(NEW_TAG) -m $(NEW_TAG)
	git push origin $(NEW_TAG)

login: ## Log into the GitHub container registry
	echo $(GITHUB_TOKEN) | docker login ghcr.io -u ARHEIO --password-stdin

build:
	docker build --tag $(IMAGE):$(CURRENT_TAG) src

push: ## Log into the GitHub container registry
	docker push $(IMAGE):$(CURRENT_TAG)
	docker push $(IMAGE):latest

inspect: ## Log into the GitHub container registry
	docker inspect $(IMAGE)

help: # Shows Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.debug:
	@echo "-------------------------"
	@echo "DEBUG"
	@echo "-------------------------"
	@echo "PATH:" $(shell pwd)
	@echo "HOSTNAME:" $(shell hostname)
	@echo "USER:" $(shell whoami)
	@echo "-------------------------"
	printenv
