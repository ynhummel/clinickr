#@ docker network create clinickr
db.setup:

	@	docker run \
		--name clinickr_db \
		-e POSTGRES_USER=clinickr \
		-e POSTGRES_PASSWORD=clinickr \
		-d \
		-p 5432:5432 \
		--network clinickr \
		postgres

app.build:
	@ docker build -t clinickr_app . 

	@ docker run \
		--name clinickr_app \
		-it \
		-v $(CURDIR):/app \
		-w /app \
		-p 4567:4567 \
		--network clinickr \
		clinickr_app \
		bash

app.up:
	@ docker start clinickr_app

app.exec:
	@docker exec -it clinickr_app bash

server:
	@docker exec clinickr_app bash -c "ruby app.rb"




	