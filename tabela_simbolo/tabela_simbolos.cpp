#include "tabela_simbolos.h"

// Construtor: inicializa a pilha com um escopo global
TabelaDeSimbolos::TabelaDeSimbolos() {
    novoEscopo();
}

// Cria um novo escopo
void TabelaDeSimbolos::novoEscopo() {
    pilha.push(unordered_map<string, Simbolo>());
}

// Remove o escopo atual
void TabelaDeSimbolos::removerEscopo() {
    if (!pilha.empty()) {
        pilha.pop();
    } else {
        printf("Erro: Nenhum escopo para remover.\n");
    }
}

// Insere um símbolo no escopo atual
void TabelaDeSimbolos::inserir(const string& nome, const string& tipo, const string& valor) {
    if (pilha.top().find(nome) != pilha.top().end()) {
        printf("Erro: Identificador '%s' já declarado no escopo atual.\n", nome.c_str());
        return;
    }
    pilha.top()[nome] = Simbolo{tipo, valor};
}

// Busca um símbolo na pilha de escopos
Simbolo* TabelaDeSimbolos::buscar(const string& nome) {
    stack<unordered_map<string, Simbolo>> temp = pilha;
    while (!temp.empty()) {
        auto it = temp.top().find(nome);
        if (it != temp.top().end()) {
            return &it->second;
        }
        temp.pop();
    }
    return nullptr;
}

// Mostra os símbolos do escopo atual
void TabelaDeSimbolos::mostrarEscopoAtual() {
    if (pilha.empty()) {
        printf("Escopo vazio.\n");
        return;
    }
    printf("Escopo atual:\n");
    for (const auto& [nome, simbolo] : pilha.top()) {
        printf("  Nome: %s, Tipo: %s, Valor: %s\n", nome.c_str(), simbolo.tipo.c_str(), simbolo.valor.c_str());
    }
}

// Insere uma função no escopo atual
void TabelaDeSimbolos::inserirFuncao(const string& nome, int numParametros, const string& tipoRetorno) {
    if (pilha.top().find(nome) != pilha.top().end()) {
        printf("Erro: Função '%s' já declarada no escopo atual.\n", nome.c_str());
        return;
    }
    pilha.top()[nome] = Simbolo{"funcao", tipoRetorno + " (" + to_string(numParametros) + " params)"};
}

// Insere um parâmetro associado a uma função
void TabelaDeSimbolos::inserirParametro(const string& nome, int tipo, int posicao, Simbolo* funcao) {
    if (pilha.top().find(nome) != pilha.top().end()) {
        printf("Erro: Parâmetro '%s' já declarado no escopo atual.\n", nome.c_str());
        return;
    }
    pilha.top()[nome] = Simbolo{"parametro", "Tipo: " + to_string(tipo) + ", Posição: " + to_string(posicao)};
    printf("Parâmetro '%s' associado à função.\n", nome.c_str());
}

// Elimina toda a pilha de escopos
void TabelaDeSimbolos::eliminarPilha() {
    while (!pilha.empty()) {
        pilha.pop();
    }
    printf("Pilha de tabelas de símbolos eliminada.\n");
}