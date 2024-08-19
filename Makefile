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

export:
	@echo "Exporting tables to CSV files"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) -e "USE $(DATABASE); \
	SELECT * FROM AREAS INTO OUTFILE '/var/lib/mysql-files/areas.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM TIPO_DE_PAGO INTO OUTFILE '/var/lib/mysql-files/tipo_de_pago.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM ABONOS INTO OUTFILE '/var/lib/mysql-files/abonos.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM PROVEEDORES INTO OUTFILE '/var/lib/mysql-files/proveedores.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM EQUIPOS INTO OUTFILE '/var/lib/mysql-files/equipos.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM CLIENTES INTO OUTFILE '/var/lib/mysql-files/clientes.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM EMPLEADOS INTO OUTFILE '/var/lib/mysql-files/empleados.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM FACTURAS INTO OUTFILE '/var/lib/mysql-files/facturas.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM OPERACIONES INTO OUTFILE '/var/lib/mysql-files/operaciones.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM ASIGNACIONES INTO OUTFILE '/var/lib/mysql-files/asignaciones.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM SUMINISTROS INTO OUTFILE '/var/lib/mysql-files/suministros.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'; \
	SELECT * FROM VENTAS INTO OUTFILE '/var/lib/mysql-files/ventas.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n';"
	@echo "Copying CSV files from container to host"
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/areas.csv ./sql_project/export_csv/areas.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/tipo_de_pago.csv ./sql_project/export_csv/tipo_de_pago.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/abonos.csv ./sql_project/export_csv/abonos.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/proveedores.csv ./sql_project/export_csv/proveedores.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/equipos.csv ./sql_project/export_csv/equipos.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/clientes.csv ./sql_project/export_csv/clientes.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/empleados.csv ./sql_project/export_csv/empleados.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/facturas.csv ./sql_project/export_csv/facturas.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/operaciones.csv ./sql_project/export_csv/operaciones.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/asignaciones.csv ./sql_project/export_csv/asignaciones.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/suministros.csv ./sql_project/export_csv/suministros.csv
	docker cp $(SERVICE_NAME):/var/lib/mysql-files/ventas.csv ./sql_project/export_csv/ventas.csv
