CMD_FRONTEND=dev
APP_CONTAINER=projectname-app
DB_CONTAINER=projectname-db

dev/local: ## Run context dev/local
	docker-compose up -d 
	docker exec -it ${APP_CONTAINER} composer install && \
	docker exec -it ${APP_CONTAINER} cp .env.example .env && \
	docker exec -it ${APP_CONTAINER} php artisan key:generate && \
	docker exec -it ${APP_CONTAINER} php artisan storage:link && \
	docker exec -it ${APP_CONTAINER} yarn install && \
	docker exec -it ${APP_CONTAINER} yarn dev && \
	docker exec -it ${APP_CONTAINER} php artisan migrate

frontend:
	docker exec -it ${APP_CONTAINER} yarn ${CMD_FRONTEND}