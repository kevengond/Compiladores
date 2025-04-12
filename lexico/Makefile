# Defina o compilador e as flags
CC = gcc
CFLAGS = -g -Wall -ansi
LFLAGS = -lm

# O arquivo executável 'goianinha' depende de main.o e lex.yy.o
goianinha: main.o lex.yy.o
	$(CC) $(CFLAGS) $(LFLAGS) lex.yy.o main.o -o goianinha

# main.o depende de main.c (o "falso sintático")
main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

# lex.yy.o é o arquivo objeto gerado a partir da compilação do arquivo lex.yy.c,
# que é gerado pelo Flex a partir de goianinha.l
lex.yy.c: goianinha.l
	flex goianinha.l

lex.yy.o: lex.yy.c
	$(CC) $(CFLAGS) -c lex.yy.c -o lex.yy.o

# Se você digitar 'make clean', os arquivos objetos (.o) e o executável serão apagados
clean:
	rm -f lex.yy.c *.o goianinha

# Se você digitar 'make cleanObj', apenas os arquivos objetos serão apagados
cleanObj:
	rm -f *.o
