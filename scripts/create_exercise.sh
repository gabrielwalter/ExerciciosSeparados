#!/usr/bin/env sh
# Script simples e portátil para criar um novo exercício
set -eu

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROG="${1:-}"

if [ -z "$PROG" ]; then
  echo "Usage: $0 exNN" >&2
  exit 1
fi

case "$PROG" in
  ex[0-9][0-9]|ex[0-9][0-9][0-9]) ;;
  *) echo "PROG deve ser no formato exNN" >&2; exit 1 ;;
esac

num=$(echo "$PROG" | sed -E 's/ex([0-9]{1,3})/\1/')
dir="$ROOT_DIR/Ex$(printf "%02d" "$num")_New"

if [ -e "$dir" ]; then
  echo "Diretório $dir já existe" >&2
  exit 1
fi

mkdir -p "$dir"

# criar exNN.c
cat > "$dir/$PROG.c" <<'C_SRC'
/* Arquivo template */
#include <stdio.h>

int soma(int a, int b) {
    return a + b;
}
C_SRC

# criar main.c (com inclusão do arquivo correto)
cat > "$dir/main.c" <<'MAIN_SRC'
/* Arquivo template main.c */
#include "REPLACE_WITH_PROG.c"

int main(void) {
    printf("Exercício criado\n");
    return 0;
}
MAIN_SRC

# substituir token REPLACE_WITH_PROG pelo nome correto do arquivo
mv "$dir/main.c" "$dir/main.c.tmp"
sed "s/REPLACE_WITH_PROG/$PROG/" "$dir/main.c.tmp" > "$dir/main.c"
rm -f "$dir/main.c.tmp"

chmod 644 "$dir/$PROG.c" "$dir/main.c"

echo "$dir criado"