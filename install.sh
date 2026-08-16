#!/usr/bin/env bash

set -e
set -u

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
OS_NAME=$(uname -s)

warn() {
    echo "Warning: $*" >&2
}

install_file() {
    src="$1"
    dest="$2"

    if [ ! -f "$src" ]; then
        warn "No se encontró $src"
        return 0
    fi

    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "Instalado: $src -> $dest"
}

install_gitconfig() {
    src="$SCRIPT_DIR/gitconfig"
    dest="$HOME/.gitconfig"

    git_name="${GIT_NAME:-}"
    git_email="${GIT_EMAIL:-}"
    git_signingkey="${GIT_SIGNINGKEY:-}"

    if [ -z "$git_name" ]; then
        warn "GIT_NAME no está definida; se usará un valor vacío."
    fi

    if [ -z "$git_email" ]; then
        warn "GIT_EMAIL no está definida; se usará un valor vacío."
    fi

    if [ -z "$git_signingkey" ]; then
        warn "GIT_SIGNINGKEY no está definida; se usará un valor vacío."
    fi

    awk -v git_name="$git_name" -v git_email="$git_email" -v git_signingkey="$git_signingkey" '
    {
        gsub(/\$\{env:GIT_NAME\}/, git_name)
        gsub(/\$\{env:GIT_EMAIL\}/, git_email)
        gsub(/\$\{env:GIT_SIGNINGKEY\}/, git_signingkey)
        print
    }' "$src" > "$dest"

    echo "Instalado: $src -> $dest"
}

install_directory() {
    src="$1"
    dest="$2"

    if [ ! -d "$src" ]; then
        warn "No se encontró el directorio $src"
        return 0
    fi

    mkdir -p "$dest"
    cp -R "$src"/. "$dest"/
    echo "Instalado directorio: $src -> $dest"
}

case "$OS_NAME" in
    Darwin)
        ;;
    Linux)
        ;;
    *)
        echo "Sistema operativo no soportado: $OS_NAME" >&2
        exit 1
        ;;
esac

common_files="curlrc gitattributes gitignore vimrc wgetrc"

for name in $common_files; do
    install_file "$SCRIPT_DIR/$name" "$HOME/.$name"
done

install_gitconfig

for src in "$SCRIPT_DIR"/Darwin.*; do
    [ -e "$src" ] || continue
    if [ "$OS_NAME" = "Darwin" ]; then
        base=$(basename "$src")
        suffix="${base#*.}"
        install_file "$src" "$HOME/.$suffix"
    fi
done

for src in "$SCRIPT_DIR"/Debian.* "$SCRIPT_DIR"/Linux.*; do
    [ -e "$src" ] || continue
    if [ "$OS_NAME" = "Linux" ]; then
        base=$(basename "$src")
        suffix="${base#*.}"
        install_file "$src" "$HOME/.$suffix"
    fi
done

install_directory "$SCRIPT_DIR/vim" "$HOME/.vim"
install_directory "$SCRIPT_DIR/m2" "$HOME/.m2"

echo "Instalación completada."
