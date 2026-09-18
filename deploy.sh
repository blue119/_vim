#!/usr/bin/env bash

set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
target="$config_dir/nvim"

if [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Refusing to replace existing configuration: %s\n' "$target" >&2
    exit 1
fi

mkdir -p -- "$config_dir"
ln -sfn -- "$repo_dir/.vim" "$target"
printf 'Neovim configuration linked: %s -> %s\n' "$target" "$repo_dir/.vim"
