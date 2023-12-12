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

echo "= fish ="
echo "== fisher =="
read -p "Install fisher (curl)? (y/n)?" choice
case "$choice" in
  y|Y )
    if [ -f "$HOME/.config/fish/functions/fisher.fish" ]; then
      echo "fisher seems to be installed already"
    else
      echo "installing fisher:"
      fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
      fish -c "fisher install jethrokuan/z"
    fi
    ;;
  n|N ) echo "skipping fisher";;
  * ) echo "invalid";;
esac


echo "= that's everything! ="
