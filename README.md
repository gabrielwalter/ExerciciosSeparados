# ExerciciosSeparados

> **Este projeto é complementar ao [MenuExercicios](https://github.com/gabrielwalter/MenuExercicios).  
> Entenda a diferença:**  
> - **MenuExercicios:** Apenas **um `int main`** no arquivo `menu.c`. Os exercícios são funções `void` chamadas pelo menu.  
> - **ExerciciosSeparados:** **Cada exercício possui sua própria função `main`** e pode ser compilado e executado individualmente.  
> Use ambos para praticar diferentes abordagens de organização e execução de exercícios!

---

## Sobre o repositório

Projeto em C que organiza exercícios de programação em arquivos separados, cada um com sua própria função `main`. Foco em modularidade, prática de lógica e automação de compilação com Makefile e CMake.

---

## Como executar no **Visual Studio** (Windows)

1. **Clone o repositório**:
    ```sh
    git clone https://github.com/gabrielwalter/ExerciciosSeparados.git
    ```
2. **Abra o Visual Studio** e selecione **"Abrir uma pasta"**.
3. Compile e execute cada arquivo individualmente:
    - Clique com o botão direito no arquivo desejado > **Compilar e Executar**.
    - Ou crie projetos separados adicionando cada arquivo como "Console Application".

---

## Como executar no **VS Code**

### Windows (nativo ou com MinGW/WSL)
1. Certifique-se de ter um compilador C instalado (MinGW ou GCC via WSL).
2. Pressione `Ctrl+Shift+B` para compilar todos os exercícios via Makefile.
3. Execute cada exercício com o comando correspondente (ex: `./bin/ex01`).

### Linux (Terminal ou WSL)
1. Compile e execute o exercício desejado:
    ```sh
    make           # Compila todos os exercícios
    ./bin/ex01     # Executa o exercício ex01
    ```

---

## 🛠️ Makefile

- `make` — compila todos os exercícios gerando binários individuais em `bin/`
- `make run PROG=ex01` — executa o binário desejado
- `make clean` — remove os binários gerados
- `make new` — cria automaticamente uma nova pasta de exercício com um `main.c`
- `make help` — mostra comandos disponíveis

---

## Estrutura

```
ExerciciosSeparados/
├── Ex01_Soma/ (pasta de exercício)
│   └── main.c    # Cada exercício tem seu próprio int main
├── Ex02_Media/
│   └── main.c
├── bin/          # Binários gerados
├── Makefile      # Build automatizado
├── .vscode/      # Configurações do VS Code (build/depuração)
├── .gitignore    # Arquivos ignorados no Git
```

---

## 📋 Requisitos

- Visual Studio 2019 ou superior (Windows) **OU**
- VS Code + GCC/MinGW (Windows, Linux, WSL)
- Make (Linux/WSL/MinGW)
- Opcional: clang-format para formatação automática

---

## Autor

Gabriel Walter  
Joinville, SC – Brasil  
Desenvolvedor em formação, focado em C, automação com Makefile e boas práticas de código.

## 🚀 Como compilar e executar

### 🪟 Visual Studio 2022 (Windows)

#### CMake (recomendado)
1. **File → Open → Folder** (abra a pasta do projeto)
2. Visual Studio detecta `CMakeLists.txt` automaticamente
3. Selecione o exercício na barra de ferramentas (ex01, ex02, etc)
4. Pressione `F5` para compilar e depurar

### 💻 VS Code (Windows, Linux, WSL, Codespaces)

#### Pré-requisitos
\```bash
# Linux/WSL/Codespaces
sudo apt update && sudo apt install -y build-essential gdb cmake

# Windows (chocolatey)
choco install mingw cmake
\```

#### Opção 1: Makefile (padrão)
1. Pressione `Ctrl+Shift+B` para compilar todos
2. Pressione `F5` para depurar (escolha o exercício)
3. Ou execute no terminal:
   \```bash
   make              # compila todos
   make run PROG=ex01  # executa ex01
   make list         # lista exercícios
   \```

#### Opção 2: CMake (cross-platform)
1. Execute no terminal:
   \```bash
   cmake -B build -S .
   cmake --build build
   ./build/ex01          # Linux
   .\build\ex01.exe      # Windows
   \```

### 📋 Comandos úteis

\```bash
make                # Compila todos os exercícios
make run PROG=ex05  # Executa exercício 05
make list           # Lista todos os exercícios
make clean          # Remove binários
make help           # Mostra ajuda
\```

