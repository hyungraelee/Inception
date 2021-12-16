NAME = inception
DOCKER_COMP = docker-compose
YML = ./srcs/docker-compose.yml
UP = up
DOWN = down
DB_DATA = /home/hyunlee/data/db
WP_DATA = /home/hyunlee/data/wp
# DB_DATA = ./db
# WP_DATA = ./wp
COMPOSE = $(DOCKER_COMP) -p $(NAME) -f $(YML)

all :
	mkdir $(DB_DATA) $(WP_DATA)
	$(COMPOSE) $(UP) -d --build

down :
	$(COMPOSE) $(DOWN)

up:
	$(COMPOSE) $(UP) -d

fclean :
	$(COMPOSE) $(DOWN) --rmi all --volumes
	rm -rf $(DB_DATA) $(WP_DATA)

re : fclean all

.PHONY : all down up fclean re
