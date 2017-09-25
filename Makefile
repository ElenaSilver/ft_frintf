# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eserebry <eserebry@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/04 22:00:19 by eserebry          #+#    #+#              #
#    Updated: 2017/09/24 23:12:18 by eserebry         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

FLAGS = -c -Wall -Wextra -Werror
CC = gcc

SRC = ft_atoi.c\
	  ft_itoa.c\
	  ft_itoa_base.c\
	  ft_lowcase.c\
	  ft_memalloc.c\
	  ft_memset.c\
	  ft_putchar.c\
	  ft_strcat.c\
	  ft_strcpy.c\
	  ft_strdup.c\
	  ft_strjoin.c\
	  ft_strlen.c\
	  ft_strncmp.c\
	  ft_strnew.c\
	  ft_strsub.c\
	  ft_uintmax_itoa.c\
	  ft_uintmax_itoa_base.c\
	  ft_printf.c\
	  parse_args.c\
	  parse_color.c\
	  parse_data_types.c\
	  parse_spec.c\
	  parse_wf.c\
	  print_base.c\
	  print_char.c\
	  print_digit.c\
	  print_extra.c\
	  print_extra2.c\
	  print_tools.c\
	  print_ptr.c\
	  print_str.c\
	  print_wchar.c\
	  print_wstr.c

OBJ = $(SRC:.c=.o)

SRCDIR = srcs
OBJDIR = objs

SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJS = $(addprefix $(OBJDIR)/, $(OBJ))
HEADER = -I includes

RM = rm -rf

all: $(NAME)

$(NAME): $(OBJS)
		@ar rc $(NAME) $(OBJS)
		@ranlib $(NAME)
		@echo "creating object files"

$(OBJDIR)/%.o: $(SRCDIR)/%.c
		@/bin/mkdir -p $(OBJDIR)
		@$(CC) $(FLAGS) $(HEADER) $< -o $@

clean:
		@/bin/$(RM) $(OBJDIR)
		@echo "object files has been deleted"

fclean: clean
		@/bin/$(RM) $(NAME)
		@echo "object files has been deleted for sure"

re: fclean all

.PHONY: all clean fclean re
.SUFFIXES: .c .o