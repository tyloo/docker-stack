# Executables
DOCKER_COMPOSE = docker compose

# Misc
.DEFAULT_GOAL = help
.PHONY = help build up start down status

## —— 🎵 Docker Stack 🎵 ———————————————————————————————————————————————————————
help: ## Output this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Build the Docker images
	@$(DOCKER_COMPOSE) build --pull --no-cache

up: ## Start the docker hub
	@$(DOCKER_COMPOSE) up -d

start: build up ## Build and start the docker hub

down: ## Stop the docker hub
	@$(DOCKER_COMPOSE) down --remove-orphans

status: ## Get the status of the docker hub
	@$(DOCKER_COMPOSE) ps -a
