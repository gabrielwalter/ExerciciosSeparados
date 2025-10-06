CC := gcc
STD := -std=c17
WARN := -Wall -Wextra -Wpedantic
OPT := -O2
DBG := -g

CFLAGS := $(STD) $(WARN) $(OPT) $(DBG)
LDFLAGS :=

VERBOSE ?= 0

ifeq ($(VERBOSE),1)
ECHO_CC = @echo "[CC] $< -> $@"
ECHO_RUN = @echo ">> Executando: $(BIN_DIR)/$(PROG) $(ARGS)"
ECHO_CLEAN = @echo "[CLEAN] Removendo $(BIN_DIR)/"
ECHO_FORMAT = @echo "[FORMAT] clang-format"
else
ECHO_CC =
ECHO_RUN =
ECHO_CLEAN =
ECHO_FORMAT =
endif

ifeq ($(DEBUG),1)
CFLAGS := $(STD) $(WARN) -O0 -g3 -fsanitize=address,undefined -fno-omit-frame-pointer
LDFLAGS := -fsanitize=address,undefined
endif

EXER_DIR := exercicios
BIN_DIR := bin

EX_MAIN := $(wildcard $(EXER_DIR)/*/main.c)
EX_NAMES := $(patsubst $(EXER_DIR)/%/main.c,%,$(EX_MAIN))
BINS := $(patsubst %,$(BIN_DIR)/%,$(EX_NAMES))

.PHONY: all run list new format clean help

all: $(BINS)

$(BIN_DIR)/%: $(EXER_DIR)/%/main.c
	@mkdir -p $(BIN_DIR)
	$(ECHO_CC)
	@$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

run: all
	@if [ -z "$(PROG)" ]; then \
		echo "Use: make run PROG=ex01 [ARGS=\"...\"]"; \
		echo "Disponíveis:"; echo $(EX_NAMES) | tr ' ' '\n'; exit 1; \
	fi
	@if [ ! -x "$(BIN_DIR)/$(PROG)" ]; then \
		echo "Binário não encontrado: $(PROG). Rode 'make'."; exit 1; \
	fi
	$(ECHO_RUN)
	@$(BIN_DIR)/$(PROG) $(ARGS)

list:
	@echo "Exercícios:"
	@if [ -n "$(EX_NAMES)" ]; then echo $(EX_NAMES) | tr ' ' '\n'; else echo "(nenhum)"; fi

new:
	@prog=$(PROG); \
	if [ -z "$$prog" ]; then \
		next=$$(printf '%s\n' $(EX_NAMES) | sed -n 's/^ex\([0-9][0-9]*\)$$/\1/p' | sort -n | tail -1); \
		if [ -z "$$next" ]; then next=1; else next=$$((next + 1)); fi; \
		prog=$$(printf 'ex%02d' $$next); \
	fi; \
	dir=$(EXER_DIR)/$$prog; \
	if [ -d $$dir ]; then echo "Já existe: $$dir"; exit 1; fi; \
	mkdir -p $$dir; \
	printf '#include <stdio.h>\n\nint main(void) {\n    printf("Ola, %s!\\n");\n    return 0;\n}\n' "$$prog" > $$dir/main.c; \
	echo "Criado: $$dir/main.c"; \
	echo "Rode: make run PROG=$$prog"

format:
	@command -v clang-format >/dev/null 2>&1 || { echo "clang-format não instalado"; exit 1; }
	@files=$$(find $(EXER_DIR) -name '*.c' -o -name '*.h'); \
	if [ -n "$$files" ]; then $(ECHO_FORMAT); clang-format -i $$files; else echo "Nada para formatar."; fi

clean:
	$(ECHO_CLEAN)
	@rm -rf $(BIN_DIR)

help:
	@echo "Targets:"
	@echo "  make / all -> compila todos os exercícios"
	@echo "  make run PROG=ex01 -> executa bin/ex01"
	@echo "  make new -> cria próximo exercício automaticamente"
	@echo "  make new PROG=exNN -> cria exercício com nome específico"
	@echo "  make list -> lista exercícios"
	@echo "  make format -> formata código"
	@echo "  make clean -> remove bin/"
	@echo "Variáveis:"
	@echo "  DEBUG=1 -> ativa sanitizers e debug intensivo"
	@echo "  VERBOSE=1 -> mostra comandos de compilação/execução"