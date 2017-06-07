default:
	@echo "Use make build|run|stop build-simple|run-simple|stop-simple"

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

