# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alearroy <alearroy@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/11 14:01:12 by alearroy          #+#    #+#              #
#    Updated: 2024/11/16 13:54:12 by alearroy         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
##                               COMPILATION INFO                             ##
################################################################################

NAME = minitalk.a
CC = cc
FLAGS = -Wall -Wextra -Werror
RM = rm -f
PRINT		= echo
WAIT1		= sleep 1
WAIT0.3		= sleep 0.3
ERASE		= printf "\033[2K\r"

################################################################################
##                              SOURCES AND OBJECTS                           ##
################################################################################

SRC = client.c server.c	\
	
OBJS_DIR	= obj
OBJS		= $(patsubst %.c, $(OBJS_DIR)/%.o, $(SRC))

LIB			= libft.a
LIB_DIR		= ./libft


################################################################################
##                                    COLOURS                                 ##
################################################################################

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_YELLOW= \033[33m
COLOUR_MAGENTA=\033[35m
COLOUR_TURQUOISE=\033[36m	
COLOUR_END=\033[0m


################################################################################
##                                     RULES                                  ##
################################################################################

all : $(LIB) $(NAME) clean

$(LIB):		
		@make -s -C $(LIB_DIR);

$(NAME):	$(OBJS)
	@$(CC) $(FLAGS) -o $@ $^ -L$(LIB_DIR) -lft
	@$(PRINT) -n "$(COLOUR_YELLOW)\n ⏱  Creating $(NAME)";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT1);$(ERASE)
	@$(PRINT) "$(COLOUR_GREEN)\r  ✓   Created  $(NAME) $(COLOUR_END)\n"
	@$(PRINT) "$(COLOUR_MAGENTA)                                    "
	@$(PRINT) "$(COLOUR_MAGENTA)                      )     (    )  "
	@$(PRINT) "$(COLOUR_MAGENTA)    )   (       (  ( /(   ) )\( /(  "
	@$(PRINT) "$(COLOUR_MAGENTA)   (    )\  (   )\ )\()| /(((_)\()) "
	@$(PRINT) "$(COLOUR_MAGENTA)   )\  ((_) )\ |(_|_))/)(_))_((_)\  "
	@$(PRINT) "$(COLOUR_MAGENTA) _((_)) (_)_(_/((_) |_((_)_| | |(_) "
	@$(PRINT) "$(COLOUR_MAGENTA)| '  \()| | ' \)) |  _/ _  | | / /  "
	@$(PRINT) "$(COLOUR_MAGENTA)|_|_|_| |_|_||_||_|\__\__,_|_|_\_\  "
	@$(PRINT) "$(COLOUR_TURQUOISE)                42MLG: by alearroy \n"
	@$(PRINT) "Project: \033[36m Minitalk $(COLOUR_TURQUOISE)"
	@$(PRINT) "Commands:\033[36m all clean fclean re $(COLOUR_END)\n"

$(OBJS_DIR):
			@mkdir -p $(OBJS_DIR)

$(OBJS_DIR)/%.o:	%.c | $(OBJS_DIR)
	@$(PRINT) " ⏱  $(COLOUR_END)Compiling $@";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT1);$(ERASE)
	@$(CC) $(FLAGS) -c $< -o $@
	@$(PRINT) "$(COLOUR_GREEN)\r  ✓   Compiled  $@ $(COLOUR_END)"

clean :
	@$(PRINT) "$(COLOUR_YELLOW) 🗑   Removing objects$(COLOUR_END)";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT1);$(ERASE)
	@$(RM)r $(OBJS_DIR) $(LIB_DIR)/obj
	@make clean -s -C $(LIB_DIR)
	@$(PRINT) "$(COLOUR_GREEN)\r  ✓  $(COLOUR_RED)Removed  objects$(COLOUR_END)"

fclean: clean
	@$(PRINT) "$(COLOUR_YELLOW) 🗑   Removing $(NAME)$(COLOUR_END)";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT0.3)
	@$(PRINT) -n ".";$(WAIT1);$(ERASE)
	@$(RM) $(NAME) $(LIB_DIR)/$(LIB).a
	@make fclean -s -C $(LIB_DIR)
	@$(PRINT) "$(COLOUR_GREEN)\r  ✓  $(COLOUR_RED)Removed  $(NAME) $(COLOUR_END)\n"

re :
	@$(MAKE) fclean
	@clear
	@$(MAKE) all

.PHONY: all clean fclean re