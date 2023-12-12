#!/usr/bin/env bash
set -e

case `uname` in
  Darwin)
    echo "= MacOS ="
    echo "== Homebrew =="
    brew bundle --file Brewfile
    echo "=== fonts ==="
    brew bundle --file fonts.brewfile
    ;;
  Linux)
    echo "= Linux ="
    ;;
  *)
    echo "= unknown name ="
    uname
    exit
    ;;
esac

echo "= asdf ="
asdf install
asdf reshim

echo "= ruby ="

echo "== bundle =="
bundle install

echo "== rake (symlink dotfiles) =="
rake

# echo "= fish ="
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
