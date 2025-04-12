
CXX = g++


CXXFLAGS = -Wall -Wextra -g

# Nome do executável
EXEC = tabela_simbolos

# Arquivos fonte
SRC = main.cpp tabela_simbolos.cpp
OBJ = $(SRC:.cpp=.o)

# Regra padrão para compilar tudo
all: $(EXEC)

# Regra para compilar o executável
$(EXEC): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $(EXEC) $(OBJ)

# Regra para compilar arquivos .cpp em .o
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regra para limpar arquivos compilados
clean:
	rm -f $(OBJ) $(EXEC)
