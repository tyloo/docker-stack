# Executables
DOCKER = docker
DOCKER_COMPOSE = @$(DOCKER) compose

# Misc
.DEFAULT_GOAL = help
.PHONY = help start stop logs status

## —— 🎵 Docker Stack 🎵 ———————————————————————————————————————————————————————
help: ## Output this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Build the docker hub
	@$(DOCKER_COMPOSE) build --no-cache

start: build ## Build and start the docker hub
	@$(DOCKER_COMPOSE) up --pull="always" --wait --detach

stop: ## Stop the docker hub
	@$(DOCKER_COMPOSE) down --remove-orphans

logs: ## Get the logs of the docker hub
	@$(DOCKER_COMPOSE) logs -f

status: ## Get the status of the docker hub
	@$(DOCKER_COMPOSE) ps -a
