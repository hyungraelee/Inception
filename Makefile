NAME = inception
DOCKER_COMP = docker-compose
YML = ./srcs/docker-compose.yml
UP = up
DOWN = down
DB_DATA = /home/hyunlee/data/db
WP_DATA = /home/hyunlee/data/wp

all :
	mkdir $(DB_DATA) $(WP_DATA)
	$(DOCKER_COMP) -p $(NAME) -f $(YML) $(UP) -d --build

clean :
	rm -rf $(DB_DATA) $(WP_DATA)

down :
	$(DOCKER_COMP) -p $(NAME) -f $(YML) $(DOWN)
up:
	$(DOCKER_COMP) -p $(NAME) -f $(YML) $(UP) -d

fclean : clean
	$(DOCKER_COMP) -p $(NAME) -f  $(YML) $(DOWN) --rmi all --volumes

re : fclean all

.PHONY : all clean fclean re
