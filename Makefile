include .env
export $(shell sed 's/=.*//' .env)

export PYTHONPATH=$(CURDIR)

define set_user_id
    export USER_ID=$(shell id -u)
	$(eval export USER_ID=$(shell id -u))
endef

.PHONY: help
help: ## Command help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: create-index
create-index: ## Create index
	@poetry run python create-index.py

.PHONY: create-document
create-document: ## Create document
	@poetry run python create-document.py

.PHONY: search-document
search-document: ## Search document
	@poetry run python search-document.py

.PHONY: delete-document
delete-document: ## Search document
	@poetry run python delete-document.py

.PHONY: delete-index
delete-index: ## Delete index
	@poetry run python delete-index.py

.PHONY: run-api
run-api:  ## Stop infra
	@poetry run uvicorn main:app --reload --port 9090 --host 0.0.0.0 --reload