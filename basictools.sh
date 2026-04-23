#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAMBA_ROOT_PREFIX="$HOME/.local/micromamba"
MAMBA_BIN="$HOME/.local/bin/micromamba"
BASIC_ENV="$HOME/.local/envs/basictools"

mkdir -p "$HOME/.vimundo"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/opt"
mkdir -p "$HOME/bin"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required to bootstrap micromamba" >&2
  exit 1
fi

if [ ! -x "$MAMBA_BIN" ]; then
  curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest \
    | tar -xj -C "$HOME/.local" bin/micromamba
fi

export MAMBA_ROOT_PREFIX
eval "$("$MAMBA_BIN" shell hook -s bash)"

if [ ! -d "$BASIC_ENV" ]; then
  "$MAMBA_BIN" create -y -p "$BASIC_ENV" -c conda-forge python
fi

if ! "$MAMBA_BIN" install -y -p "$BASIC_ENV" -c conda-forge fzf socat ripgrep fd-find; then
  "$MAMBA_BIN" install -y -p "$BASIC_ENV" -c conda-forge fzf socat ripgrep fd
fi

for cmd in fzf socat rg; do
  if [ -x "$BASIC_ENV/bin/$cmd" ]; then
    ln -sf "$BASIC_ENV/bin/$cmd" "$HOME/.local/bin/$cmd"
  fi
done

if [ -x "$BASIC_ENV/bin/fd" ]; then
  ln -sf "$BASIC_ENV/bin/fd" "$HOME/.local/bin/fd"
elif [ -x "$BASIC_ENV/bin/fdfind" ]; then
  ln -sf "$BASIC_ENV/bin/fdfind" "$HOME/.local/bin/fd"
fi

if [ -x "$BASIC_ENV/bin/python" ]; then
  "$MAMBA_BIN" run -p "$BASIC_ENV" python -m pip install ranger-fm pyright
  for cmd in ranger pyright; do
    if [ -x "$BASIC_ENV/bin/$cmd" ]; then
      ln -sf "$BASIC_ENV/bin/$cmd" "$HOME/.local/bin/$cmd"
    fi
  done
fi

git -C "$SCRIPT_DIR" config url."https://github.com/".insteadOf git@github.com:
git -C "$SCRIPT_DIR" submodule sync --recursive
git -C "$SCRIPT_DIR" submodule update --init --recursive

if [ -f "$SCRIPT_DIR/fasd/Makefile" ]; then
  make -C "$SCRIPT_DIR/fasd" install PREFIX="$HOME/.local"
else
  if [ ! -d "$HOME/.local/opt/fasd/.git" ]; then
    rm -rf "$HOME/.local/opt/fasd"
    git clone https://github.com/clvv/fasd.git "$HOME/.local/opt/fasd"
  fi
  make -C "$HOME/.local/opt/fasd" install PREFIX="$HOME/.local"
fi

bash "$SCRIPT_DIR/copyconfig.sh"
echo "copied configs"
