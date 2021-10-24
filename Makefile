build:
	docker build -t drip:latest .

setup-db:
	docker-compose run --rm web poetry run python manage.py migrate
	docker-compose run --rm -e DJANGO_SUPERUSER_PASSWORD=password web \
		poetry run python manage.py createsuperuser --username=admin \
		--email=admin@localhost --noinput