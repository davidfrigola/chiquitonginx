default:
	@echo "Use make build|run|stop"

build:
	docker-compose build
run:
	docker-compose up
stop:
	docker-compose stop
