#!/usr/bin/env bash
set -e

case $(uname) in
  Darwin)
    echo "= MacOS ="
    echo "== Homebrew =="
    brew bundle --file Brewfile
    echo "=== gamedev ==="
    read -n 1 -r -p "Install gamedev.Brewfile? (y/n)?" choice
    case "$choice" in
      y|Y )
        brew bundle --file gamedev.Brewfile
        ;;
      * ) echo "skipping gamedev.Brewfile";;
    esac
    echo "=== fonts ==="
    read -n 1 -r -p "Install fonts.Brewfile? (y/n)?" choice
    case "$choice" in
      y|Y )
        brew bundle --file fonts.Brewfile
        ;;
      * ) echo "skipping fonts.Brewfile";;
    esac
    echo "=== virtualization ==="
    read -n 1 -r -p "Install virtualization.Brewfile? (y/n)?" choice
    case "$choice" in
      y|Y )
        brew bundle --file virtualization.Brewfile
        ;;
      * ) echo "skipping virtualization.Brewfile";;
    esac
    ;;
  Linux)
    echo "= Linux ="
    echo "== apt =="
    sudo apt install curl git make gcc unzip zlib1g-dev fish
    echo "== asdf =="
    if [ -d ~/.asdf ]; then
      echo "asdf appears to be installed"
      source ~/.asdf/asdf.sh
    else
      echo "asdf not installed. cloning..."
      git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
      source ~/.asdf/asdf.sh
    fi
    ;;
  MINGW64_NT-10.0-19045)
    echo "= git bash for windows?!? ="
    pwsh.exe windows_setup.ps1
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
asdf plugin-add golang
asdf install
asdf reshim

echo "= ruby ="

echo "== bundle =="
bundle install

echo "== rake (symlink dotfiles) =="
rake

echo "= fish ="
echo "== install fisher =="
if [ -f "$HOME/.config/fish/functions/fisher.fish" ]; then
  echo "fisher seems to be installed already"
else
  read -n 1 -r -p "Install fisher (curl)? (y/n)?" choice
  case "$choice" in
    y|Y )
      echo "installing fisher:"
      fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
      ;;
    n|N ) echo "skipping fisher";;
    * ) echo "invalid";;
  esac
fi

echo "== fisher plugins =="
fish -c "fisher install FabioAntunes/base16-fish-shell"
fish -c "fisher install jethrokuan/z"
fish -c "fisher install jorgebucaran/getopts.fish"


echo "= that's everything! ="
