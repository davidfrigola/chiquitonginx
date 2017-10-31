default:
	@echo "Use make build|run|stop|build-simple|run-simple|stop-simple|build-tests|run-tests"
	@echo "make build - builds the simple docker compose definition"
	@echo "make run - starts docker compose "
	@echo "make run-simple - starts simple docker compose definition"
	@echo "make stop - stops docker compose running"
	@echo "make stop-simple - stops simple docker compose definition"
	@echo "make build-tests - builds test docker compose definition"
	@echo "make run-tests - rungs test docker compose defintion - CTRL+C when tests done to stop it"

build:
	docker-compose build

build-simple:
	docker-compose -f docker-compose-simple.yml build

run:
	docker-compose up

run-simple:
	docker-compose -f docker-compose-simple.yml up

stop:
	docker-compose stop

stop-simple:
	docker-compose -f docker-compose-simple.yml stop

build-tests:
	docker-compose -f docker-compose-test.yml build

run-tests:
	docker-compose -f docker-compose-test.yml up

