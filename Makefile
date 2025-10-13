CC = gcc
CFLAGS = -std=c17 -Wall -Wextra -g
BIN_DIR = bin

EXER_DIRS = $(wildcard Ex[0-9][0-9]_*)

# Ensure bin exists early on Unix-like systems (helps avoid "No such file or directory" from the linker)
ifeq ($(OS),Windows_NT)
else
$(shell mkdir -p $(BIN_DIR))
endif

# Prefer bash on Unix-like systems when available. Do not run shell probing on Windows.
ifeq ($(OS),Windows_NT)
	# On Windows keep the default shell (cmd) so we don't run Unix utilities accidentally
else
	ifneq (,$(shell which bash 2>/dev/null))
		SHELL := /bin/bash
	endif
endif

.PHONY: all clean list run help

ifeq ($(OS),Windows_NT)

	# Detect PowerShell (pwsh or powershell) and prefer a PowerShell-safe creation command
	ifneq (,$(findstring pwsh,$(SHELL)))
		MKDIR_CMD = powershell -NoProfile -Command "if(-Not (Test-Path -Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Path '$(BIN_DIR)' | Out-Null }"
	else ifneq (,$(findstring powershell,$(SHELL)))
		MKDIR_CMD = powershell -NoProfile -Command "if(-Not (Test-Path -Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Path '$(BIN_DIR)' | Out-Null }"
	else
		# fallback para cmd.exe
		MKDIR_CMD = if not exist $(BIN_DIR) mkdir $(BIN_DIR)
	endif
else
	MKDIR_CMD = mkdir -p $(BIN_DIR)
endif

.PHONY: all-unix all-win

# Default `all` delegates to platform-specific targets
ifeq ($(OS),Windows_NT)
all: all-win
else
all: all-unix
endif

all-win:
	@$(MKDIR_CMD)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Host 'Building (Windows) with build.ps1'; & '$(CURDIR)\\build.ps1' -Release"

all-unix:
	@$(MKDIR_CMD)
	@bash -c 'for dir in $(EXER_DIRS); do num=$$(echo $$dir | sed "s/Ex\([0-9][0-9]\)_.*/\1/"); echo "Compilando $$dir..."; $(CC) $(CFLAGS) $$dir/main.c -o $(BIN_DIR)/ex$$num || exit 1; if command -v chmod >/dev/null 2>&1; then chmod +x $(BIN_DIR)/ex$$num || true; fi; done'


.PHONY: run-win run-unix run
ifeq ($(OS),Windows_NT)
run: run-win
else
run: run-unix
endif

run-win:
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "if ('$(PROG)' -eq '') { Write-Host 'Use: make run PROG=ex01'; Write-Host 'Exercícios:'; & make list; exit 1 }; $$exe = Get-ChildItem -Path 'bin' -Filter '$(PROG)*.exe' -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1; if ($$null -eq $$exe) { Write-Error 'Executable not found in bin/'; exit 1 } else { & $$exe.FullName }"

run-unix:
	@bash -lc 'if [ -z "$(PROG)" ]; then echo "Use: make run PROG=ex01"; echo "Exercícios:"; make list; exit 1; fi; echo "Nota: no ambiente Unix/WSL prefira executar o binário diretamente:"; echo "  ./$(BIN_DIR)/$(PROG)"; echo "Ou use: cmake --build build && ./bin/$(PROG)"'

ifeq ($(OS),Windows_NT)
list:
	@powershell -NoProfile -ExecutionPolicy Bypass -File scripts\list.ps1
else
list:
	@for dir in $(EXER_DIRS); do \
		num=$$(echo $$dir | sed 's/Ex\([0-9][0-9]\)_.*/\1/'); \
		echo "  ex$$num ($$dir)"; \
	done
endif

clean:
ifeq ($(OS),Windows_NT)
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "if (Test-Path -Path '$(BIN_DIR)') { Remove-Item -Recurse -Force -ErrorAction SilentlyContinue '$(BIN_DIR)' }"
else
	@rm -rf $(BIN_DIR)
endif

help:
	@echo "make all     - compila todos"
	@echo "make run PROG=ex01 - executa"
	@echo "make list    - lista exercícios"
	@echo "make clean   - limpa binários"
	@echo "make new PROG=ex12 NAME=MeuExercicio - cria novo exercício (unix/wsl)"
	@echo "  ou: make new NUM=12 NAME=MeuExercicio - cria novo exercício (aceita NUM ou PROG)"

.PHONY: new new-unix new-win
ifeq ($(OS),Windows_NT)
new: new-win
else
new: new-unix
endif

new-unix:
	@if [ -z "$(PROG)" -a -z "$(NUM)" ]; then \
		echo "Use: make new PROG=ex12 NAME=MeuExercicio  OR make new NUM=12 NAME=MeuExercicio"; \
		exit 1; \
	fi; \
	if [ -z "$(PROG)" ]; then \
		prog=$$(printf "ex%02d" $(NUM)); \
	else \
		prog="$(PROG)"; \
	fi; \
	num=$$(echo "$$prog" | sed -E 's/ex0*([0-9]+)/\1/'); \
	padded=$$(printf "%02d" $$num); \
	name=$${NAME:-Novo}; \
	dir="Ex$${padded}_$${name}"; \
	if [ -d "$$dir" ]; then echo "$$dir already exists"; exit 1; fi; \
	mkdir -p "$$dir"; \
	cp .templates/ex_template.c "$$dir/$$prog.c"; \
	cp .templates/main_template.c "$$dir/main.c"; \
	sed -i "s/__PROG__/$$prog/g" "$$dir/$$prog.c"; \
	sed -i "s/__PROG__/$$prog/g" "$$dir/main.c"; \
	mkdir -p $(BIN_DIR); \
	echo "Created $$dir with $$prog.c and main.c"; \
	echo "Compiling $$prog to $(BIN_DIR)/ex$$num..."; \
	$(CC) $(CFLAGS) "$$dir/main.c" -o $(BIN_DIR)/ex$$num || { echo "compilação falhou"; exit 1; }; \
	if command -v chmod >/dev/null 2>&1; then chmod +x $(BIN_DIR)/ex$$num || true; fi; \
	echo "Compiled $(BIN_DIR)/ex$$num"

new-win:
	@powershell -NoProfile -ExecutionPolicy Bypass -File scripts\new.ps1 -Prog '$(PROG)' -Num '$(NUM)' -Name '$(NAME)'
