CC = gcc
CFLAGS = -std=c17 -Wall -Wextra -g
BIN_DIR = bin

EXER_DIRS = $(wildcard Ex[0-9][0-9]_* )

.PHONY: all clean list run help new

all:
	@mkdir -p $(BIN_DIR)
	@for dir in $(EXER_DIRS); do \
		num=$$(basename $$dir | sed 's/Ex\([0-9][0-9]\)_.*/\1/'); \
		printf "Compilando %s...\n" $$dir; \
		$(CC) $(CFLAGS) $$dir/main.c -o $(BIN_DIR)/ex$$num && chmod +x $(BIN_DIR)/ex$$num; \
	done

run:
	@if [ -z "$(PROG)" ]; then \
		echo "Use: make run PROG=ex01"; \
		echo "Exercícios:"; make list; \
		exit 1; \
	fi; \
	@$(BIN_DIR)/$(PROG)

list:
	@for dir in $(EXER_DIRS); do \
		num=$$(basename $$dir | sed 's/Ex\([0-9][0-9]\)_.*/\1/'); \
		printf "  ex%02d (%s)\n" $$num $$dir; \
	done

clean:
	rm -rf $(BIN_DIR)

help:
	@echo "make all     - compila todos"
	@echo "make run PROG=ex01 - executa"
	@echo "make list    - lista exercícios"
	@echo "make clean   - limpa binários"

# Cria novo exercício: usa shell POSIX ou PowerShell quando disponível
new:
	@if [ -z "$(PROG)" ]; then \
		echo "Use: make new PROG=ex11"; \
		exit 1; \
	fi; \
	@if command -v sh >/dev/null 2>&1; then \
		sh ./scripts/create_exercise.sh $(PROG); \
	elif command -v pwsh >/dev/null 2>&1; then \
		pwsh -NoProfile -ExecutionPolicy Bypass -File ./scripts/create_exercise.ps1 -Prog $(PROG); \
	elif command -v powershell >/dev/null 2>&1; then \
		powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/create_exercise.ps1 -Prog $(PROG); \
	else \
		echo "Nenhum shell compatível encontrado. Instale sh (Linux/WSL) ou PowerShell."; \
		exit 1; \
	fi
