/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 278,                 /* "invalid token"  */
    TK_PROGRAM = 258,              /* TK_PROGRAM  */
    TK_CAR = 259,                  /* TK_CAR  */
    TK_INT = 260,                  /* TK_INT  */
    TK_RETORNE = 261,              /* TK_RETORNE  */
    TK_LEIA = 262,                 /* TK_LEIA  */
    TK_ESCREVA = 263,              /* TK_ESCREVA  */
    TK_NOVALINHA = 264,            /* TK_NOVALINHA  */
    TK_SE = 265,                   /* TK_SE  */
    TK_ENTAO = 266,                /* TK_ENTAO  */
    TK_SENAO = 267,                /* TK_SENAO  */
    TK_ENQUANTO = 268,             /* TK_ENQUANTO  */
    TK_EXECUTE = 269,              /* TK_EXECUTE  */
    TK_ID = 270,                   /* TK_ID  */
    TK_CAD_CAR = 271,              /* TK_CAD_CAR  */
    TK_INTCONST = 272,             /* TK_INTCONST  */
    TK_DIF = 273,                  /* TK_DIF  */
    TK_MENOR_IGUAL = 274,          /* TK_MENOR_IGUAL  */
    TK_MAIOR_IGUAL = 275,          /* TK_MAIOR_IGUAL  */
    TK_MENOR = 276,                /* TK_MENOR  */
    TK_MAIOR = 277,                /* TK_MAIOR  */
    TK_ERROR = 279,                /* TK_ERROR  */
    TK_OU = 280,                   /* TK_OU  */
    TK_E = 281,                    /* TK_E  */
    TK_IGUAL = 282,                /* TK_IGUAL  */
    NEG = 283,                     /* NEG  */
    UNEG = 284                     /* UNEG  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
