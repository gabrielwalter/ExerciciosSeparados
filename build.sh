#!/usr/bin/env bash
set -euo pipefail

echo "Iniciando build (bash)..."
mkdir -p build
cmake -S . -B build
cmake --build build --config Release

echo "Build concluído. Verifique a pasta build/ e bin/ (se o projeto gerar binários lá)."