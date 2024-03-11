edit:
	nano Makefile

nginx:
	nano  /etc/nginx/sites-available/vnc

docker:
	nano docker-compose.yml

env:
	nano .env

up:
	docker compose up -d
down:
	docker compose down

restart:
	make down
	make up
	
bash:
	docker exec -it vnc-docker-desktop-vnc-1 /bin/bash

install-docker:
	

install-nginx:
	apt update
	apt install nginx
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
	cp vnc /etc/nginx/sites-available/
	ln -s /etc/nginx/sites-available/ /etc/nginx/sites-enabled
	nginx -t

install-firewall:
	ufw enable
	ufw allow 6082