build:
	docker-compose build --no-cache
console:
	docker-compose run --rm php bash
dev:
	docker-compose up
stop:
	docker-compose down
