# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adbenoit <adbenoit@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/13 18:38:18 by adbenoit          #+#    #+#              #
#    Updated: 2020/03/12 17:40:56 by adbenoit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= cub3d

INC			= includes/

INC_BONUS	= includes/bonus/

HEADER	= $(INC)cub3d.h

SRCS_PATH	= srcs

UTILS_PATH	= srcs/utils

PARSO_PATH	= srcs/obligatory/parsing

OBL_PATH	= srcs/obligatory

RAY_PATH	= srcs/raycasting

BONUS_PATH	= srcs/bonus

PARSB_PATH	= srcs/bonus/parsing


SRCS_NAME	=	main.c\
				move.c\
				bmp_file.c

BONUS_NAME	=	create_img_bonus.c\
				ft_deal_key_bonus.c\
				ft_error_bonus.c\
				mini_map_bonus.c\
				start_bonus.c\
				weapon_bonus.c

PARS_NAME	=	check_info.c\
				ft_space.c\
				ft_strtrim.c\
				map.c\
				pars_error.c\
				parsing.c

OBL_NAME	=	create_img.c\
				ft_deal_key.c\
				ft_error.c\
				start.c

RAY_NAME	=	sprite.c\
				texture.c\
				wall.c\
				wall_utils.c


UTILS_NAME	=	ft_atoi.c\
				ft_bzero.c\
				ft_memcpy.c\
				ft_putnbr_fd.c\
				ft_realloc.c\
				ft_rgb.c\
				get_next_line.c\
				get_next_line_utils.c

OBJ_PATH	= obj

OBJ_B_PATH	= obj/bonus

OBJ_NAME	= $(UTILS_NAME:.c=.o)
OBJ_NAME	+= $(PARS_NAME:.c=.o)
OBJ_NAME	+= $(SRCS_NAME:.c=.o)
OBJ_NAME	+= $(OBL_NAME:.c=.o)
OBJ_NAME	+= $(RAY_NAME:.c=.o)

OBJ_B_NAME	= $(UTILS_NAME:.c=.o)
OBJ_B_NAME	+= $(PARS_NAME:.c=.o)
OBJ_B_NAME	+= $(SRCS_NAME:.c=.o)
OBJ_B_NAME	+= $(BONUS_NAME:.c=.o)
OBJ_B_NAME	+= $(RAY_NAME:.c=.o)

CC	= gcc

CFLAGS	= -Wall -Werror -Wextra

MLX_DIR	= minilibx

MLX	= $(MLX_DIR)/libmlx.a

MLX_LIBS	= -lmlx -lXext -lX11

OBJ	= $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

OBJ_B	= $(addprefix $(OBJ_B_PATH)/,$(OBJ_B_NAME))

all: $(MLX) $(NAME)

bonus: $(MLX) $(OBJ_B)
	@printf "\n"
	@$(CC) -o $(NAME) $(OBJ_B) $(MLX) -framework OpenGL -framework AppKit
	@echo "Compilation of \033[33;1m$(NAME) bonus\033[0;1m: [\033[1;32mOK\033[0;1m]"

$(MLX) :
	@make -C $(MLX_DIR) $(MLX_LIBS)
	@echo "Compilation of \033[33;1m$(MLX_DIR)\033[0;1m: [\033[1;32mOK\033[0;1m]"

$(NAME):	$(OBJ)
	@printf "\n"
	@$(CC) -o $(NAME) $(OBJ) $(MLX) -framework OpenGL -framework AppKit
	@echo "Compilation of \033[33;1m$(NAME)\033[0;1m: [\033[1;32mOK\033[0;1m]"

######### OBLIGATOIRE #############

$(OBJ_PATH)/%.o:	$(UTILS_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC) -c $< -o $@

$(OBJ_PATH)/%.o:	$(PARSO_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC) -c $< -o $@

$(OBJ_PATH)/%.o:	$(SRCS_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC) -c $< -o $@

$(OBJ_PATH)/%.o:	$(RAY_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC) -c $< -o $@

$(OBJ_PATH)/%.o:	$(OBL_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC) -c $< -o $@

######### BONUS #############

$(OBJ_B_PATH)/%.o:	$(UTILS_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_B_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC_BONUS) -c $< -o $@

$(OBJ_B_PATH)/%.o:	$(PARSB_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_B_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC_BONUS) -c $< -o $@

$(OBJ_B_PATH)/%.o:	$(SRCS_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_B_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC_BONUS) -c $< -o $@

$(OBJ_B_PATH)/%.o:	$(RAY_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_B_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC_BONUS) -c $< -o $@

$(OBJ_B_PATH)/%.o:	$(BONUS_PATH)/%.c $(HEADER)
	@printf "\033[34;1m| \033[0;1m"
	@mkdir $(OBJ_B_PATH) 2> /dev/null || true
	@$(CC) $(CFLAGS) -I$(INC_BONUS) -c $< -o $@

clean:
	@make -C $(MLX_DIR) clean
	@rm -f $(OBJ)
	@rm -rf $(OBJ_PATH)
	@echo "\033[33;1m$(NAME)\033[0;1m: objects deleted\033[0m"

fclean:	clean
	@rm -rf $(NAME)
	@echo "\033[33;1m$(NAME)\033[0;1m: $(NAME) deleted\033[0m"

re: fclean all

.PHONY: all clean fclean re