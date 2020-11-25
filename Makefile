#!/usr/bin/env make

include makefile.env
export

dc := docker-compose.yml

up:
	@docker-compose --file ${dc} up --detach
down:
	@docker-compose --file ${dc} down --volumes
ps:
	@docker-compose --file ${dc} ps
logs:
	@docker-compose --file ${dc} logs --follow

