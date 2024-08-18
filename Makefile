#!make
include .env

# Variables
DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./sql_project/database_structure.sql
DATABASE_POPULATION=./sql_project/population.sql
IMPORT_VENTAS=./sql_project/import_ventas.csv

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

FILES=vistas funciones stored_procedures triggers

.PHONY: all up objects test-db access-db down import-ventas

all: info up objects import-ventas

info:
	@echo "This is a project for $(DATABASE)"

up:
	@echo "Create the instance of docker"
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MySQL to be ready..."
	bash mysql_wait.sh

	@echo "Create the database and run the population script"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source $(DATABASE_CREATION);"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --local-infile=1 -e "source $(DATABASE_POPULATION)"

import-ventas:
	@echo "Importing data from import_ventas.csv"
	@docker exec -it $(SERVICE_NAME) sh -c "if [ -f /sql_project/import_ventas.csv ]; then echo 'File exists, proceeding with import'; else echo 'File not found!'; exit 1; fi"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --local-infile=1 -e "USE $(DATABASE); LOAD DATA LOCAL INFILE '/sql_project/import_ventas.csv' INTO TABLE VENTAS FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;"

objects:
	@echo "Create objects in database"
	@for file in $(FILES); do \
	    echo "Process $$file and add to the database: $(DATABASE)"; \
	    docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source ./sql_project/database_objects/$$file.sql"; \
	done

test-db:
	@echo "Testing the tables"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source ./sql_project/check_db_objects.sql"

access-db:
	@echo "Access to db-client"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD)

down:
	@echo "Remove the Database"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Bye"
	docker compose -f $(DOCKER_COMPOSE_FILE) down
