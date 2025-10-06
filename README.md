# ExerciciosSeparados

Cada código tem sua função `main`.

## Sobre o repositório

Projeto em C que organiza exercícios de programação em arquivos separados, com foco em modularidade, prática de lógica e uso eficiente de Makefile.

### Diferencial em relação ao projeto [MenuExercicios](https://github.com/gabrielwalter/MenuExercicios)

- **MenuExercicios**: Contém apenas uma função `int main` no arquivo `menu.c`. Os demais exercícios possuem apenas funções `void`, sendo chamadas pelo menu principal.
- **ExerciciosSeparados** (este repositório): **Cada exercício possui sua própria função `main`**, possibilitando compilar e executar cada arquivo separadamente, sem necessidade de um menu central.

---

## Como executar no **Visual Studio 2022** (Windows)

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/gabrielwalter/ExerciciosSeparados.git
   ```
2. **Abra o Visual Studio 2022** e selecione **"Abrir uma pasta"**.
3. Selecione a pasta clonada do repositório.
4. Visual Studio irá detectar os arquivos `.c`. Você pode compilar e executar cada arquivo individualmente:
   - Clique com o botão direito no arquivo desejado > **Compilar e Executar**.
   - Caso prefira criar projetos separados, basta adicionar cada arquivo como um novo projeto do tipo "Console Application".

---

## Como executar no **VS Code**

### **Windows (nativo ou com MinGW/WSL)**

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/gabrielwalter/ExerciciosSeparados.git
   ```
2. **Abra a pasta no VS Code**.
3. Certifique-se de ter um compilador C instalado (MinGW ou GCC via WSL).

- **Compilando um exercício individual** (exemplo para `exercicio1.c`):
  ```sh
  gcc exercicio1.c -o exercicio1
  ./exercicio1
  ```

### **Linux (Terminal ou WSL)**

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/gabrielwalter/ExerciciosSeparados.git
   cd ExerciciosSeparados
   ```
2. **Compile e execute o exercício desejado**:
   ```sh
   gcc exercicio2.c -o exercicio2
   ./exercicio2
   ```

---

## Dicas Extras

- Os arquivos estão organizados para facilitar a identificação de cada exercício.
- Modifique ou crie novos arquivos `.c` à vontade, sempre mantendo a função `main` separada para cada exercício.
- O uso de `Makefile` e `CMake` está disponível no repositório para facilitar automação de compilação. Consulte os arquivos correspondentes para instruções específicas.

---

## 🛠️ Estrutura

Cada exercício está em um arquivo .c separado (ex: ex01.c, ex02.c, etc.), com sua própria função main(). Isso permite testes isolados, facilita a manutenção e torna o projeto mais modular.

---

## 🚀 Como compilar e executar com Makefile

Requisitos:
- GCC instalado
- Make instalado

Comandos:
```sh
make            # Compila todos os arquivos .c e gera os executáveis
make clean      # Remove os binários gerados
```

Se houver um Makefile com suporte a make run, ele pode executar um dos exercícios automaticamente.

---

## 📂 Exemplo de uso

```sh
$ make
gcc -std=c17 -Wall -O2 -g ex01.c -o ex01
gcc -std=c17 -Wall -O2 -g ex02.c -o ex02
...
$ ./ex01
(Saída do exercício 01)
```

---

## Linguagens utilizadas

- **C** (principal)
- Makefile, CMake, Shell, PowerShell (scripts e automação)

---

## 📌 Autor

Gabriel Walter  
Joinville, SC – Brasil  
Desenvolvedor em formação, focado em C, automação com Makefile e boas práticas de código.