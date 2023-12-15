#!/usr/bin/env bash
set -e

case $(uname) in
  Darwin)
    echo "= MacOS ="
    echo "== Homebrew =="
    brew bundle --file Brewfile
    echo "=== fonts ==="
    brew bundle --file fonts.Brewfile
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
asdf plugin-add lua
asdf plugin-add nodejs
asdf plugin-add ruby
asdf install
asdf reshim

echo "= ruby ="

echo "== bundle =="
bundle install

echo "== rake (symlink dotfiles) =="
rake

echo "= fish ="
echo "== fisher =="
read -n 1 -r -p "Install fisher (curl)? (y/n)?" choice
case "$choice" in
  y|Y )
    if [ -f "$HOME/.config/fish/functions/fisher.fish" ]; then
      echo "fisher seems to be installed already"
    else
      echo "installing fisher:"
      fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
      fish -c "fisher install FabioAntunes/base16-fish-shell"
      fish -c "fisher install jethrokuan/z"
      fish -c "fisher install jorgebucaran/getopts.fish"
    fi
    ;;
  n|N ) echo "skipping fisher";;
  * ) echo "invalid";;
esac


echo "= that's everything! ="
