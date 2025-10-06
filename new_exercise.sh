#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXER_DIR="$ROOT_DIR/exercicios"

prog="${1:-}"

if [[ -z "$prog" ]]; then
    mapfile -t existing < <(find "$EXER_DIR" -maxdepth 1 -mindepth 1 -type d -name 'ex[0-9][0-9]*' -printf '%f\n' | sort)
    if [[ "${#existing[@]}" -eq 0 ]]; then
        next=1
    else
        last="${existing[-1]}"
        number="${last#ex}"
        if [[ "$number" =~ ^[0-9]+$ ]]; then
            next=$((10#$number + 1))
        else
            next=1
        fi
    fi
    prog=$(printf 'ex%02d' "$next")
fi

make -s -C "$ROOT_DIR" new PROG="$prog"

code -r "$EXER_DIR/$prog/main.c"

echo "$prog"
