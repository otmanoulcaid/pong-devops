NETWORKS		=	$$(docker network ls -q)
IMAGES			=	$$(docker image ls -q)
VOLUMES			=	$$(docker volume ls -q)
CONTAINERS		=	$$(docker ps -aq)
YML_PATH		=	docker-compose.yaml

all: up

up:
	@docker compose -f $(YML_PATH) $@ --build

down:
	@docker compose -f $(YML_PATH) $@

stop:
	@docker compose -f $(YML_PATH) $@

rmcontainers:
	@docker stop $(CONTAINERS) > /dev/null 2>&1 || true
	@docker rm $(CONTAINERS) > /dev/null 2>&1 || true

rmimages:
	@docker image rm $(IMAGES) > /dev/null 2>&1 || true

rmnetworks:
	@docker network rm $(NETWORKS)  > /dev/null 2>&1 || true 

rmvolumes:
	@docker volume rm $(VOLUMES)  > /dev/null 2>&1 || true

clean: rmcontainers rmnetworks

fclean: docker system prune -a 

re: fclean up

.PHONY: up down stop rmcontainers rmimages rmnetworks rmvolumes
