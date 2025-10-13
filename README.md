
# 📚 ExerciciosSeparados

> **🆕 Primeira vez aqui? Este guia vai te ensinar TUDO passo a passo!**

---

## 🤔 O que é este projeto?

Este projeto tem vários **exercícios de programação em C**, cada um em sua **própria pasta** e pode ser executado **separadamente**.

**Exemplo da estrutura:**
```
Ex01_Soma/          ← Exercício 1 (calcula soma)
Ex02_Media/         ← Exercício 2 (calcula média)
Ex03_ParOuImpar/    ← Exercício 3 (verifica par ou ímpar)
...
```

### 🔗 Diferença entre os projetos

| Projeto | Como funciona | Quando usar |
|---------|---------------|-------------|
| **MenuExercicios** | Um programa com menu, todos exercícios juntos | Quando você quer navegar entre exercícios facilmente |
| **ExerciciosSeparados** (este) | Cada exercício é um programa separado | Quando você quer testar um exercício por vez |

---
---

## ⚠️ IMPORTANTE: Acentuação e caracteres especiais

### ✅ Este projeto JÁ está configurado!

Cada exercício neste projeto já contém a configuração necessária para exibir acentos corretamente no Windows.

Os arquivos `main.c` de cada exercício já incluem:

```c
SetConsoleOutputCP(65001);  // Configura console para UTF-8
SetConsoleCP(65001);
setlocale(LC_ALL, "pt_BR.UTF-8");
```

**Isso significa que:**
- ✅ Quando você **clonar este repositório**, os acentos já funcionarão automaticamente
- ✅ Você **NÃO precisa fazer nada** após clonar
- ✅ A configuração já está salva no código e será baixada junto com o projeto

### 🔧 Se você criar um NOVO exercício do zero

Se você for criar um novo exercício em C no Windows e quiser que acentos funcionem:

1. Adicione `#include <windows.h>` no topo do arquivo
2. No início da função `main()`, adicione:
   ```c
   SetConsoleOutputCP(65001);
   SetConsoleCP(65001);
   setlocale(LC_ALL, "pt_BR.UTF-8");
   ```
3. Salve todos os arquivos `.c` em **UTF-8 com assinatura (BOM)**
   - No Visual Studio: File → Save As → Save with Encoding → UTF-8 with signature

### 🐛 Se os acentos aparecerem estranhos

Isso pode acontecer se:
- Você editou arquivos fora do Visual Studio (ex: Notepad)
- Os arquivos foram salvos em outra codificação

**Solução:**
1. No Visual Studio, abra cada arquivo `.c`
2. Vá em File → Advanced Save Options
3. Escolha **UTF-8 with signature - Codepage 65001**
4. Salve o arquivo
5. Compile e execute novamente

---

## 🚀 COMO USAR - Passo a Passo

### 📍 Primeira vez? Escolha seu ambiente:

<details>
<summary><b>🌐 Estou no GitHub Codespaces (navegador)</b></summary>

**Você já está pronto!** O ambiente já tem tudo instalado.

1. Abra o terminal (`` Ctrl+` `` ou menu Terminal → New Terminal)
2. Compile todos os exercícios:
   ```bash
   make
   ```
3. Execute um exercício específico:
   ```bash
   make run PROG=ex01    # Executa o exercício 1
   make run PROG=ex05    # Executa o exercício 5
   ```
4. Veja a lista de exercícios disponíveis:
   ```bash
   make list
   ```

**Para depurar (F5):**
- Pressione `F5`
- É preciso instalar a extensão C/C++ da Microsoft no Codespace
- Escolha "Debug - Escolher exercício"
- Digite o nome (ex: `ex01`)
- O programa vai parar nos breakpoints

</details>

<details>
<summary><b>💻 Estou no VS Code no Windows</b></summary> AZAR!!! NÃO ESTÁ RODANDO O MAKE!! NÃO DEPURA!!

### Passo 1: Instalar ferramentas necessárias

**Opção A - Instalar tudo de uma vez (recomendado):**
1. Abra o PowerShell **como Administrador**
2. Instale o Chocolatey (gerenciador de pacotes):
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
3. Instale o compilador e CMake:
   ```powershell
   choco install mingw cmake make -y
   ```
4. **Feche e abra o VS Code novamente**

**Opção B - Instalar o Visual Studio Build Tools:**
1. Baixe: https://visualstudio.microsoft.com/downloads/
2. Instale "Build Tools for Visual Studio"
3. Marque "Desktop development with C++"

### Passo 2: Compilar e executar

No VS Code:
1. Abra a pasta do projeto (File → Open Folder)
2. Abra o terminal (`` Ctrl+` ``)
3. Compile:
   ```bash
   make
   ```
4. Execute um exercício:
   ```bash
   make run PROG=ex01
   ```

**OU simplesmente:**
- Pressione `Ctrl+Shift+B` (compila todos)
- Pressione `F5` (escolhe qual exercício debugar)

</details>

<details>
<summary><b>💻 Estou no VS Code no Linux/Mac</b></summary>

### Passo 1: Instalar ferramentas necessárias

Abra o terminal e execute:

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install build-essential gdb cmake -y
```

**Fedora:**
```bash
sudo dnf install gcc gdb cmake make -y
```

**Mac:**
```bash
brew install gcc cmake
```

### Passo 2: Compilar e executar

No VS Code:
1. Abra a pasta do projeto (File → Open Folder)
2. Abra o terminal (`` Ctrl+` ``)
3. Compile:
   ```bash
   make
   ```
4. Execute um exercício:
   ```bash
   make run PROG=ex01
   ```

**OU simplesmente:**
- Pressione `Ctrl+Shift+B` (compila todos)
- Pressione `F5` (escolhe qual exercício debugar)

</details>

<details>
<summary><b>🪟 Estou no Visual Studio 2022 (Windows)</b></summary>

### Como usar com CMake (Recomendado)

1. Abra o Visual Studio 2022
2. Clique em **"Abrir uma pasta local"** (ou File → Open → Folder)
3. Selecione a pasta `ExerciciosSeparados`
4. O Visual Studio vai detectar o `CMakeLists.txt` automaticamente
5. Aguarde alguns segundos (ele vai configurar o projeto)
6. **Na barra de ferramentas**, escolha qual exercício executar:
   - Clique na lista suspensa (onde está escrito "Selecionar Item de Inicialização")
   - Escolha `ex01.exe`, `ex02.exe`, etc.
7. Pressione `F5` para compilar e executar o exercício escolhido

**Dica:** Você pode alternar entre diferentes exercícios sem recompilar tudo!

</details>

<details>
<summary><b>🐧 Estou no WSL (Windows Subsystem for Linux) / VS Code no Windows</b></summary>

Se você usa WSL + VS Code, é comum o terminal integrado pedir a passphrase da sua chave SSH em cada nova sessão — isso pode interromper operações como depuração. Uma solução prática é usar o `keychain` para carregar a chave apenas na primeira abertura da sessão.

Passos rápidos:
1. Instale o keychain:
   ```bash
   sudo apt update && sudo apt install keychain -y
   ```

2. Adicione ao final do seu `~/.bashrc` (substitua `id_ed25519` pelo nome da sua chave, se for diferente):
   ```bash
   eval "$(keychain --eval --agents ssh id_ed25519)"
   ```

3. Recarregue o shell ou abra um novo terminal:
   ```bash
   source ~/.bashrc
   ```

Notas importantes:
- Na primeira abertura após reboot/login você deverá digitar a passphrase; depois disso o keychain reaplica a chave para novas shells na mesma sessão até o próximo reboot/login.
- Para verificar se a chave foi carregada: `ssh-add -l`
- Segurança: nunca adicione chaves privadas ou passphrases neste README nem em repositórios públicos.

- Para usuários de `zsh`: adicione a mesma linha ao seu `~/.zshrc` em vez do `~/.bashrc`:
   ```bash
   eval "$(keychain --eval --agents ssh id_ed25519)"
   ```

- Encaminhar o agente SSH do Windows para o WSL: se você usa o OpenSSH do Windows (ou um agente do Windows), é possível encaminhar o agente para o WSL e evitar gerenciar chaves separadamente. Essa configuração é mais avançada e depende do agente que você usa (OpenSSH, Pageant, etc.). Se quiser, posso descrever o passo a passo para o seu caso.

</details>

---

## 🐛 Como depurar (encontrar erros)

### No VS Code:
1. Abra o arquivo que você quer debugar (ex: `Ex01_Soma/main.c`)
2. Clique na margem esquerda (ao lado do número da linha) para criar um **breakpoint** (bolinha vermelha)
3. Pressione `F5`
4. Escolha qual exercício você quer debugar (ex: `ex01`)
5. O programa vai **parar** no breakpoint
6. Use os botões no topo para:
   - ▶️ **Continue** (F5) - continua até o próximo breakpoint
   - ⏭️ **Step Over** (F10) - executa linha por linha
   - ⏬ **Step Into** (F11) - entra dentro de funções
   - ⏹️ **Stop** (Shift+F5) - para a execução

### No Visual Studio 2022:
1. Escolha o exercício na barra de ferramentas
2. Clique na margem esquerda para criar breakpoint
3. Pressione F5

---

## 📁 Estrutura do projeto (o que cada pasta/arquivo faz)

```
ExerciciosSeparados/
├── Ex01_Soma/          ← Exercício 1
│   ├── main.c          ← Código principal (tem int main)
│   └── ex01.c          ← Implementação
├── Ex02_Media/         ← Exercício 2
│   ├── main.c
│   └── ex02.c
├── Ex03_ParOuImpar/    ← Exercício 3
├── ... (Ex04 a Ex10)
│
├── bin/                ← Binários compilados (ex01, ex02, etc)
├── build/              ← Arquivos temporários do CMake
│
├── Makefile            ← Receita de como compilar (Linux/Mac)
├── CMakeLists.txt      ← Receita de como compilar (todas plataformas)
├── .vscode/            ← Configurações do VS Code
│   ├── tasks.json      ← Como compilar no VS Code
│   └── launch.json     ← Como depurar no VS Code
└── README.md           ← Este arquivo!
```

---

## 🆘 Problemas comuns e soluções

### "make: command not found"
**Solução:** Você precisa instalar o Make.
- **Windows:** `choco install make`
- **Linux:** `sudo apt install make`
- **Mac:** `brew install make`

### "gcc: command not found" ou "cl.exe not found"
**Solução:** Você precisa instalar um compilador C.
- **Windows:** Instale MinGW ou Visual Studio Build Tools
- **Linux:** `sudo apt install build-essential`
- **Mac:** `xcode-select --install`

### "Permission denied" ao executar ./bin/ex01
**Solução:**
```bash
chmod +x bin/ex01
./bin/ex01
```

### Erro: "Binário não encontrado: ex01"
**Solução:** Compile primeiro!
```bash
make
make run PROG=ex01
```

### Erro: CMakeCache.txt criado em outro caminho (WSL vs Windows)

Se você alternar entre executar CMake no Windows (PowerShell / Visual Studio) e em um ambiente Unix-like (WSL, Git Bash ou Codespaces), pode ver um erro parecido com:

> The current CMakeCache.txt directory ... is different than the directory ... where CMakeCache.txt was created.

Isso acontece porque o CMake salva caminhos absolutos no cache e, ao rodar em outro subsystem (ex.: `/mnt/c/...` vs `C:/...`), os caminhos não batem. A solução simples é limpar a pasta `build` antes de reconfigurar:

```bash
# Em bash/WSL/Codespaces
rm -rf build
cmake -S . -B build
cmake --build build
```

No PowerShell (Windows):

```powershell
Remove-Item -Recurse -Force build
.\build.ps1
```

Após isso, reconfigure o projeto no ambiente desejado (Visual Studio, PowerShell, WSL, etc.) e os builds funcionarão normalmente.

### No Visual Studio: não aparece "ex01.exe" na lista
**Solução:** 
1. Feche o Visual Studio
2. Delete a pasta `out/` ou `build/`
3. Abra o projeto novamente
4. Aguarde o CMake reconfigurar

---

## 📚 Comandos úteis

### Makefile:
```bash
make                  # Compila TODOS os exercícios
make run PROG=ex01    # Executa o exercício 01
make run PROG=ex05    # Executa o exercício 05
make list             # Lista todos os exercícios
make clean            # Remove binários
make help             # Mostra ajuda
```

### CMake (cross-platform):
```bash
cmake -B build -S .     # Configura o projeto
cmake --build build     # Compila TODOS
./build/ex01            # Executa ex01 (Linux/Mac)
.\build\ex01.exe        # Executa ex01 (Windows)
```

---

## ➕ Como adicionar um novo exercício

### Manualmente:
1. Crie uma pasta: `Ex11_MeuExercicio/`
2. Crie o arquivo `main.c` dentro dela:
   ```c
   #include <stdio.h>

   int main(void) {
       printf("Meu novo exercício!\n");
       return 0;
   }
   ```
3. Compile:
   ```bash
   make
   ```
4. Execute:
   ```bash
   make run PROG=ex11
   ```

### Automaticamente:
```bash
make new NUM=11 NAME=MeuExercicio
```

### Criar novo exercício automaticamente com `make new`

Você também pode criar um novo exercício a partir dos templates com o alvo `make new`.

- No Windows (PowerShell):

```powershell
make new PROG=ex13 NAME=Ex13    # cria Ex13_Ex13/ex13.c e main.c
make new NUM=14 NAME=Teste      # cria Ex14_Teste/ex14.c e main.c
```

- No WSL / Linux / macOS (bash):

```bash
make new PROG=ex15 NAME=WSLTest
# ou
make new NUM=15 NAME=WSLTest
```

O comando usa os templates em `.templates/` e substitui `__PROG__` pelo nome do programa (`exNN`). No Windows o Make delega a criação para `scripts/new.ps1` (PowerShell); em ambientes POSIX a criação é feita pelo fluxo de make/bash.

Nota importante sobre comportamento por plataforma:

- No WSL / Linux / macOS: `make new` cria os arquivos a partir dos templates e, em seguida, tenta compilar apenas o exercício recém-criado (gera `bin/exNN`). Isso facilita testar rapidamente o exercício recém-criado.

- No Windows (PowerShell): `make new` apenas cria os arquivos (não compila automaticamente). Isso evita dependências de compilador/ambiente no Windows e mantém o processo explícito.

Se você quiser que o Windows também compile automaticamente, posso adicionar isso — me pergunte antes, pois pode falhar se o Visual Studio/MinGW não estiver configurado.


Isso vai criar a pasta `Ex11_MeuExercicio/` com um `main.c` pronto!

---

## 💡 Dicas para estudar

1. **Comece pelo Ex01_Soma** - é o mais simples
2. **Leia o código** antes de executar
3. **Modifique algo** e veja o que acontece
4. **Use breakpoints** para entender o fluxo
5. **Compare** com o projeto MenuExercicios
6. **Crie seus próprios exercícios**

---

## 🔗 Links úteis

- [Projeto complementar - MenuExercicios](https://github.com/gabrielwalter/MenuExercicios)
- [Documentação do VS Code para C](https://code.visualstudio.com/docs/languages/cpp)
- [Tutorial de Makefile](https://makefiletutorial.com/)

---

## ❓ Ainda com dúvidas?

Abra uma **Issue** no GitHub explicando seu problema:
https://github.com/gabrielwalter/ExerciciosSeparados/issues

---

**Bons estudos! 🚀**
