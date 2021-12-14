all :
	docker-compose -p inception -f ./srcs/docker-compose.yml up -d --build


clean :
	rm -rf ./srcs/web ./srcs/data

fclean : clean
	docker-compose -p inception -f ./srcs/docker-compose.yml down --rmi all --volumes

re : fclean all

.PHONY : all clean re
