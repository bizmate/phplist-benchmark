SHELL := /usr/bin/env bash
PROJECT_ROOT := $(dir $(lastword $(MAKEFILE_LIST)))
COMPOSER_HOME := $$HOME/.config/composer
COMPOSER_CACHE_DIR := $$HOME/.cache/composer

build:
	docker-compose build

bash: check_uid_and_env_vars
	export UID && docker-compose exec php bash

up: check_uid_and_env_vars
	export COMPOSER_HOME=$(COMPOSER_HOME) && export COMPOSER_CACHE_DIR=$(COMPOSER_CACHE_DIR) && export UID && docker-compose up -d

down:
	docker-compose down

logs_tail:
	if [ -z "$(UID)" ]; then echo "UID variable required, please run 'export UID' before running make task"; exit 1 ; fi
	export UID && docker-compose logs -f

composer_bash:
	export UID && export COMPOSER_HOME=$(COMPOSER_HOME) && export COMPOSER_CACHE_DIR=$(COMPOSER_CACHE_DIR)  && docker-compose run composer bash

mailcatcher_bash:
	export UID && export COMPOSER_HOME=$(COMPOSER_HOME) && export COMPOSER_CACHE_DIR=$(COMPOSER_CACHE_DIR)  && docker-compose run smtp /bin/ash

docker-compose-config:
	echo $(COMPOSER_HOME)
	export COMPOSER_HOME=$(COMPOSER_HOME) && export COMPOSER_CACHE_DIR=$(COMPOSER_CACHE_DIR)  && docker-compose config

check_uid_and_env_vars:
	if [ -z "$(UID)" ]; then echo "UID variable required, please run 'export UID' before running make task"; exit 1 ; fi
