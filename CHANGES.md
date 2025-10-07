# 🔧 Alterações Realizadas para Cross-Platform

## ✅ Arquivos Modificados

### 1. `Makefile`
- ✅ Adaptado para estrutura Ex##_Nome/
- ✅ Adicionado `chmod +x` após compilação para permissões no Linux
- ✅ Compila cada Ex##_Nome/main.c para bin/ex##
- ✅ Simplificado e otimizado

### 2. `CMakeLists.txt`
- ✅ Adaptado para estrutura de pastas Ex##_Nome/
- ✅ Compila apenas main.c de cada pasta
- ✅ Cria executáveis ex01, ex02, etc.
- ✅ Flags específicas por plataforma (MSVC vs GCC)
- ✅ Suporte a UTF-8 no Visual Studio 2022

### 3. `.gitignore`
- ✅ Adicionado `bin/` (binários do Makefile)
- ✅ Adicionado `build/` (CMake)
- ✅ Adicionados arquivos temporários do CMake
- ✅ Adicionados binários ex##

## 📄 Arquivos Criados

### 4. `.vscode/launch.json` ⭐ **NOVO**
- ✅ Configuração de debug para gdb
- ✅ Duas configurações: Debug ex01 fixo e Debug com escolha
- ✅ Input para escolher qual exercício debugar

### 5. `.vscode/tasks.json` ⭐ **NOVO**
- ✅ Tasks para Make (compilar, executar, limpar)
- ✅ Tasks para CMake (configure, build)
- ✅ Input para escolher exercício a executar
- ✅ Ctrl+Shift+B compila todos

### 6. `.editorconfig` ⭐ **NOVO**
- ✅ UTF-8 em todos os arquivos
- ✅ Line endings LF (Linux-style)
- ✅ Indentação consistente entre editores

### 7. `CHANGES.md` ⭐ **ESTE ARQUIVO**
- ✅ Documentação completa das alterações

---

## 🎯 Como usar agora

### No GitHub Codespaces / VS Code (Linux)
\```bash
# Makefile (padrão)
make            # compila todos
make run PROG=ex01  # executa ex01
# Pressione F5 para debug

# CMake (alternativa)
cmake -B build -S .
cmake --build build
./build/ex01
\```

### No Visual Studio 2022 (Windows)
1. **Abrir como CMake:**
   - File → Open → Folder (selecione a pasta do projeto)
   - VS detecta `CMakeLists.txt` automaticamente
   - Selecione o target (ex01, ex02, etc) na barra
   - Pressione F5 para compilar e executar

### No VS Code Desktop (Windows)
\```bash
# Instale primeiro (se necessário):
choco install mingw cmake

# Depois:
make
make run PROG=ex01
\```

---

## 🐛 Debug (F5)

### VS Code
- ✅ Pressione F5
- ✅ Escolha "Debug ex01" ou "Debug - Escolher exercício"
- ✅ Se escolher a segunda opção, digite o nome (ex01, ex02, etc)
- ✅ Breakpoints funcionam

### Visual Studio 2022
- ✅ Selecione o target na barra de ferramentas
- ✅ Pressione F5
- ✅ Debug nativo com IntelliSense

---

## 📊 Resumo das Vantagens

| Recurso | Antes | Depois |
|---------|-------|--------|
| **Visual Studio 2022** | ⚠️ CMake básico | ✅ CMake otimizado com UTF-8 |
| **VS Code Codespaces** | ⚠️ Makefile antigo | ✅ Makefile + CMake + Debug (F5) |
| **VS Code Desktop Linux** | ⚠️ Funciona parcialmente | ✅ Funciona perfeitamente |
| **VS Code Desktop Windows** | ❌ Difícil configurar | ✅ CMake + MinGW ou MSVC |
| **Debug (F5)** | ❌ Não configurado | ✅ Funciona em todas plataformas |
| **Build System** | Makefile complexo | ✅ Makefile simples + CMake |
| **Estrutura** | Ex##_Nome/main.c | ✅ Mantida, adaptada |

---

## 🔄 Estrutura do Projeto

\```
ExerciciosSeparados/
├── Ex01_Soma/
│   ├── ex01.c          # Implementação
│   └── main.c          # Ponto de entrada (compilado)
├── Ex02_Media/
│   ├── ex02.c
│   └── main.c
├── ... (Ex03 a Ex10)
├── bin/                # Binários do Make (ex01, ex02, ...)
├── build/              # Binários do CMake
├── .vscode/
│   ├── launch.json     # Debug config
│   └── tasks.json      # Build tasks
├── .editorconfig       # Config de editor
├── .gitignore
├── CMakeLists.txt      # Build cross-platform
├── Makefile            # Build Linux/Make
└── README.md
\```

---

## 🎓 Recomendações

1. **Para desenvolvimento rápido:** Use `make` no Linux/Codespaces
2. **Para cross-platform:** Use CMake
3. **Para Visual Studio:** Abra a pasta (CMake)
4. **Para debug:** Pressione F5 em qualquer plataforma
5. **Para executar específico:** `make run PROG=ex05`
