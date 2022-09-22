# Docker Stack
To see all the available commands, run `make help`.

## Change ports binding
If you want to change the local binding ports for one service, copy the override file (`cp docker-compose.override.yml.dist docker-compose.override.yml`) and modify the left value (`LOCAL:DOCKER`, ex: `3306:3306` => `3309:3306`).
