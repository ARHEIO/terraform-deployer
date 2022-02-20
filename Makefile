# -----------------------------------
# MAKEFILE VARS
# -----------------------------------

.DEFAULT_GOAL := help

GITHUB_TOKEN ?=

.PHONY: init plan planAuto apply applyAuto destroy .env .debug

# -----------------------------------
# MAKE TARGETS
# -----------------------------------

version: ## Build the image
	./bin/version.sh

login: ## Log into the GitHub container registry
	echo $(GITHUB_TOKEN) | docker login ghcr.io -u ARHEIO --password-stdin

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
