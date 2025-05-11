CC = gcc
LEX = flex
YACC = bison
CFLAGS = -g -Wall -std=c99 -D_POSIX_C_SOURCE=200809L
EXEC = goianinha

LEXICO_DIR = ../lexico
SINTATICO_DIR = .
LEX_FILE = $(LEXICO_DIR)/goianinha.l
YACC_FILE = $(SINTATICO_DIR)/parser.y

OBJS = lex.yy.o parser.tab.o

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ -lfl

lex.yy.o: lex.yy.c parser.tab.h
	$(CC) $(CFLAGS) -c lex.yy.c -o lex.yy.o

parser.tab.o: parser.tab.c
	$(CC) $(CFLAGS) -c parser.tab.c -o parser.tab.o

lex.yy.c: $(LEX_FILE)
	$(LEX) $<

parser.tab.c parser.tab.h: $(YACC_FILE)
	$(YACC) -d $<

clean:
	rm -f $(OBJS) lex.yy.c parser.tab.* $(EXEC)

cleanWin:
	del *.o lex.yy.c parser.tab.* $(EXEC).exe