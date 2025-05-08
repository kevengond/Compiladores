#include "tabela_simbolos.h"

// Inicializa a pilha de escopos
void inicializarPilha(PilhaDeEscopos* pilha) {
    pilha->topo = NULL;
}

// Cria um novo escopo
void novoEscopo(PilhaDeEscopos* pilha) {
    Escopo* novo = (Escopo*)malloc(sizeof(Escopo));
    if (!novo) {
        printf("Erro: Falha ao alocar memória para o novo escopo.\n");
        exit(1);
    }
    novo->simbolos = NULL;
    novo->prox = pilha->topo;
    pilha->topo = novo;
}

// Remove o escopo atual
void removerEscopo(PilhaDeEscopos* pilha) {
    if (!pilha->topo) {
        printf("Erro: Nenhum escopo para remover.\n");
        return;
    }

    Escopo* escopoRemovido = pilha->topo;
    pilha->topo = escopoRemovido->prox;

    // Libera os símbolos do escopo
    NoSimbolo* atual = escopoRemovido->simbolos;
    while (atual) {
        NoSimbolo* temp = atual;
        atual = atual->prox;
        free(temp->nome);
        free(temp->simbolo.tipo);
        free(temp->simbolo.valor);
        free(temp);
    }

    free(escopoRemovido);
}

// Insere um símbolo no escopo atual
void inserirSimbolo(PilhaDeEscopos* pilha, const char* nome, const char* tipo, const char* valor) {
    if (!pilha->topo) {
        printf("Erro: Nenhum escopo criado.\n");
        return;
    }

    // Verifica se o símbolo já existe no escopo atual
    NoSimbolo* atual = pilha->topo->simbolos;
    while (atual) {
        if (strcmp(atual->nome, nome) == 0) {
            printf("Erro: Identificador '%s' já declarado no escopo atual.\n", nome);
            return;
        }
        atual = atual->prox;
    }

    // Cria um novo símbolo
    NoSimbolo* novo = (NoSimbolo*)malloc(sizeof(NoSimbolo));
    if (!novo) {
        printf("Erro: Falha ao alocar memória para o símbolo.\n");
        exit(1);
    }

    novo->nome = strdup(nome);
    novo->simbolo.tipo = strdup(tipo);
    novo->simbolo.valor = strdup(valor);
    novo->prox = pilha->topo->simbolos;
    pilha->topo->simbolos = novo;
}

// Busca um símbolo na pilha de escopos
Simbolo* buscarSimbolo(PilhaDeEscopos* pilha, const char* nome) {
    Escopo* escopoAtual = pilha->topo;
    while (escopoAtual) {
        NoSimbolo* atual = escopoAtual->simbolos;
        while (atual) {
            if (strcmp(atual->nome, nome) == 0) {
                return &atual->simbolo;
            }
            atual = atual->prox;
        }
        escopoAtual = escopoAtual->prox;
    }
    return NULL;
}

// Mostra os símbolos do escopo atual
void mostrarEscopoAtual(PilhaDeEscopos* pilha) {
    if (!pilha->topo) {
        printf("Escopo vazio.\n");
        return;
    }

    printf("Escopo atual:\n");
    NoSimbolo* atual = pilha->topo->simbolos;
    while (atual) {
        printf("  Nome: %s, Tipo: %s, Valor: %s\n",
               atual->nome, atual->simbolo.tipo, atual->simbolo.valor);
        atual = atual->prox;
    }
}

// Elimina toda a pilha de escopos
void eliminarPilha(PilhaDeEscopos* pilha) {
    while (pilha->topo) {
        removerEscopo(pilha);
    }
    printf("Pilha de tabelas de símbolos eliminada.\n");
}