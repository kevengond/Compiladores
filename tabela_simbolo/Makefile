
CC = gcc


CFLAGS = -Wall -g

# Nome do executável
EXEC = tabela_simbolos

# Arquivos fonte
SRC = main.c tabela_simbolos.c
OBJ = $(SRC:.c=.o)

# Regra padrão para compilar tudo
all: $(EXEC)

# Regra para compilar o executável
$(EXEC): $(OBJ)
	$(CC) $(CFLAGS) -o $(EXEC) $(OBJ)

# Regra para compilar arquivos .c em .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Regra para limpar arquivos compilados
clean:
	rm -f $(OBJ) $(EXEC)
