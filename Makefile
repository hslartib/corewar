# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshellie <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/13 17:06:50 by lshellie          #+#    #+#              #
#    Updated: 2019/10/13 17:06:51 by blanna           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_COR = error.c parse.c read_files.c vm_main.c start_game.c cursor.c\
			print_dump.c check_cursors.c fight.c do_op.c live_forks_zjmp.c\
			players.c type_byte.c get_args.c manage_type.c ops1.c ops2.c

OBJ_COR = $(SRC_COR:.c=.o)

SRC_ASM = asm.c into_bytecode.c create_file.c free.c init_data.c\
			lexical_check.c champ_data.c process.c syntax_check.c support.c

OBJ_ASM = $(SRC_ASM:.c=.o)

COR = corewar

ASM = asm

LIB = libft/libft.a

all: $(COR) $(ASM)

$(COR): $(LIB) $(OBJ_COR)
	gcc -Wall -Wextra -Werror -o $(COR) $(LIB) $(OBJ_COR)
$(ASM): $(LIB) $(OBJ_ASM)
	@gcc -Wall -Wextra -Werror -o $(ASM) $(LIB) $(OBJ_ASM)
$(LIB):
	make -C ./libft
$(OBJ_COR) :%.o: srcs/vm/%.c includes/corewar.h
	gcc -c -I includes/corewar.h $<
$(OBJ_ASM) :%.o: srcs/asm/%.c includes/asm.h includes/asm_ops.h includes/op.h
	@gcc -c -I includes/asm.h $<
clean:
	@make clean -C ./libft
	@rm -rf $(OBJ_COR)
	@rm -rf $(OBJ_ASM)
fclean: clean
	@make fclean -C ./libft
	@rm -rf $(COR)
	@rm -rf $(ASM)
re: fclean all
