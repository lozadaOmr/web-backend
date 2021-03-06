COMPOSE_FILE?=development.yml

build:
	docker-compose -f compose/${COMPOSE_FILE} build

run:
	docker-compose -f compose/${COMPOSE_FILE} up -d

stop:
	docker-compose -f compose/${COMPOSE_FILE} stop

rm:
	docker-compose -f compose/${COMPOSE_FILE} rm -f

logs:
	docker-compose -f compose/${COMPOSE_FILE} logs -f --tail 250 api worker

migrations:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py makemigrations

migrate:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py migrate

dbconfig:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py loaddata database_config

shell:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py shell

superuser:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py createsuperuser

testsentry:
	docker-compose -f compose/${COMPOSE_FILE} exec api python manage.py raven test
