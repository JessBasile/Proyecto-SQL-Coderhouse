# Cargar variables de entorno desde el archivo .env
include .env

# Variables
SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=$(MYSQL_ROOT_PASSWORD)
DATABASE=$(MYSQL_DATABASE)
USER=$(MYSQL_USER)

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./sql_project/database_structure.sql
DATABASE_POPULATION=./sql_project/population.sql
IMPORT_VENTAS_SQL=./sql_project/import_ventas.sql

FILES=vistas funciones stored_procedures triggers

.PHONY: all up objects test-db access-db down import-ventas

all: up objects import-ventas

up:
	@echo "Create the instance of docker"
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MySQL to be ready..."
	bash mysql_wait.sh

	@echo "Create the database structure and populate it"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source /sql_project/database_structure.sql;"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --local-infile=1 -e "source /sql_project/population.sql;"

import-ventas:
	@echo "Importing ventas data"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "SET GLOBAL local_infile = 1; USE $(DATABASE); SOURCE $(IMPORT_VENTAS_SQL);"

objects:
	@echo "Create objects in database"
	@for file in $(FILES); do \
		echo "Process $$file and add to the database: $(DATABASE)"; \
		docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source /sql_project/database_objects/$$file.sql"; \
	done

test-db:
	@echo "Testing the tables"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source /sql_project/check_db_objects.sql;"

access-db:
	@echo "Access to db-client"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD)

down:
	@echo "Remove the Database"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Bye"
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

