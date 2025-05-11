#ifndef TABELA_SIMBOLOS_H
#define TABELA_SIMBOLOS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct Simbolo {
    char* tipo;
    char* valor;
} Simbolo;


typedef struct NoSimbolo {
    char* nome;              
    Simbolo simbolo;         
    struct NoSimbolo* prox;  
} NoSimbolo;


typedef struct Escopo {
    NoSimbolo* simbolos;     
    struct Escopo* prox;     
} Escopo;


typedef struct PilhaDeEscopos {
    Escopo* topo;            
} PilhaDeEscopos;


void inicializarPilha(PilhaDeEscopos* pilha);
void novoEscopo(PilhaDeEscopos* pilha);
void removerEscopo(PilhaDeEscopos* pilha);
void inserirSimbolo(PilhaDeEscopos* pilha, const char* nome, const char* tipo, const char* valor);
Simbolo* buscarSimbolo(PilhaDeEscopos* pilha, const char* nome);
void mostrarEscopoAtual(PilhaDeEscopos* pilha);
void eliminarPilha(PilhaDeEscopos* pilha);

#endif // TABELA_SIMBOLOS_H