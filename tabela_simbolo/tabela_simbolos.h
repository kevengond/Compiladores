#ifndef TABELA_SIMBOLOS_H
#define TABELA_SIMBOLOS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Estrutura para representar um símbolo
typedef struct Simbolo {
    char* tipo;
    char* valor;
} Simbolo;

// Nó da lista encadeada para armazenar os símbolos de um escopo
typedef struct NoSimbolo {
    char* nome;              // Nome do símbolo
    Simbolo simbolo;         // Dados do símbolo
    struct NoSimbolo* prox;  // Próximo símbolo na lista
} NoSimbolo;

// Estrutura para representar um escopo (tabela de símbolos)
typedef struct Escopo {
    NoSimbolo* simbolos;     // Lista encadeada de símbolos
    struct Escopo* prox;     // Próximo escopo na pilha
} Escopo;

// Estrutura para representar a pilha de escopos
typedef struct PilhaDeEscopos {
    Escopo* topo;            // Topo da pilha
} PilhaDeEscopos;

// Funções da tabela de símbolos
void inicializarPilha(PilhaDeEscopos* pilha);
void novoEscopo(PilhaDeEscopos* pilha);
void removerEscopo(PilhaDeEscopos* pilha);
void inserirSimbolo(PilhaDeEscopos* pilha, const char* nome, const char* tipo, const char* valor);
Simbolo* buscarSimbolo(PilhaDeEscopos* pilha, const char* nome);
void mostrarEscopoAtual(PilhaDeEscopos* pilha);
void eliminarPilha(PilhaDeEscopos* pilha);

#endif // TABELA_SIMBOLOS_H