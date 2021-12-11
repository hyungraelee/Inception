
all :
	docker-compose -f ./srcs/docker-compose.yml up -d --build
#-p inception

clean :
	docker-compose -f ./srcs/docker-compose.yml down

fclean :
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

re : fclean all

.PHONY : all clean re
