# Executables
DOCKER = docker
DOCKER_COMPOSE = @$(DOCKER) compose

# Misc
.DEFAULT_GOAL = help
.PHONY = help build up start down logs status

## —— 🎵 Docker Stack 🎵 ———————————————————————————————————————————————————————
help: ## Output this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Builds the Docker images
	@$(DOCKER_COMPOSE) build --pull --no-cache

up: ## Start the docker hub in detached mode (no logs)
	@$(DOCKER_COMPOSE) up --detach

start: build up ## Build and start the containers

down: ## Stop the docker hub
	@$(DOCKER_COMPOSE) down --remove-orphans

logs: ## Show live logs
	@$(DOCKER_COMPOSE) logs --tail=0 --follow

status: ## Get the status of the docker hub
	@$(DOCKER_COMPOSE) ps -a
