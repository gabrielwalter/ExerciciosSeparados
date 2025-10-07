CC = gcc
CFLAGS = -std=c17 -Wall -Wextra -g
BIN_DIR = bin

EXER_DIRS = $(wildcard Ex[0-9][0-9]_*)

.PHONY: all clean list run help

all:
	@mkdir -p $(BIN_DIR)
	@for dir in $(EXER_DIRS); do \
		num=$$(echo $$dir | sed 's/Ex\([0-9][0-9]\)_.*/\1/'); \
		echo "Compilando $$dir..."; \
		$(CC) $(CFLAGS) $$dir/main.c -o $(BIN_DIR)/ex$$num && chmod +x $(BIN_DIR)/ex$$num; \
	done

run:
	@if [ -z "$(PROG)" ]; then \
		echo "Use: make run PROG=ex01"; \
		echo "Exercícios:"; make list; \
		exit 1; \
	fi; \
	$(BIN_DIR)/$(PROG)

list:
	@for dir in $(EXER_DIRS); do \
		num=$$(echo $$dir | sed 's/Ex\([0-9][0-9]\)_.*/\1/'); \
		echo "  ex$$num ($$dir)"; \
	done

clean:
	rm -rf $(BIN_DIR)

help:
	@echo "make all     - compila todos"
	@echo "make run PROG=ex01 - executa"
	@echo "make list    - lista exercícios"
	@echo "make clean   - limpa binários"
