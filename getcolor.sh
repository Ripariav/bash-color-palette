#!/bin/bash

COLOR_NAME="$1"
COLOR_FILE="$HOME/.scripts/Funcionamiento/colorscheme/colorscheme.toml"

if [[ -z "$COLOR_NAME" ]]; then
  echo "Uso: getcolor.sh <nombre_del_color>"
  exit 1
fi

# Requiere yq (v4+) con soporte para TOML
if ! command -v yq &> /dev/null; then
  echo "El comando 'yq' no está instalado. Instálalo con: yay -S yq"
  exit 1
fi

# Extrae el color desde el archivo
HEX=$(yq eval ".colors.${COLOR_NAME}" "$COLOR_FILE")

if [[ "$HEX" == "null" ]]; then
  echo "Color '$COLOR_NAME' no encontrado."
  exit 1
fi

echo "$HEX"
