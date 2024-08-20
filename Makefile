# Makefile
include .env

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./sql_project/database_structure.sql
DATABASE_POPULATION=./sql_project/population.sql

FILES=vistas funciones stored_procedures triggers user_roles

.PHONY: all up objects test-db access-db down count-ventas count-operaciones export

all: info up objects

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

count-ventas:
	@echo "Counting records in VENTAS"
	@docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "USE $(DATABASE); SELECT CONCAT('VENTAS: ', COUNT(*)) AS Total_Ventas FROM VENTAS;"

count-operaciones:
	@echo "Counting records in OPERACIONES"
	@docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "USE $(DATABASE); SELECT CONCAT('OPERACIONES: ', COUNT(*)) AS Total_Operaciones FROM OPERACIONES;"

objects:
	@echo "Create objects in database"
	@for file in $(FILES); do \
	    echo "Process $$file and add to the database: $(DATABASE)"; \
	    docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source ./sql_project/database_objects/$$file.sql"; \
	done

test-db:
	@echo "Testing the tables"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source ./sql_project/check_db_objects.sql"
	@make count-ventas
	@make count-operaciones

access-db:
	@echo "Access to db-client"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD)

down:
	@echo "Remove the Database"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Bye"
	docker compose -f $(DOCKER_COMPOSE_FILE) down


backup:
	@echo "Creating backup ..."
	docker exec $(SERVICE_NAME) sh -c 'mysqldump -u${USER} -p${PASSWORD} --host $(HOST) --port 3306 --routines --databases $(DATABASE) > ./backup_Wifly.sql'
	cd sql_project && mkdir dump
	docker cp $(SERVICE_NAME):/backup_Wifly.sql ./sql_project/dump/backup_Wifly.sql


export:

	@echo "Exporting tables to CSV files"
	cd sql_project && mkdir export_csv
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "source /sql_project/export.sql";
