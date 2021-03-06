#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# source: https://github.com/michaeljsmalley/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".vim .vimrc .gitconfig .gitignore .tmux.conf .rubocop.yml"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ -f "$file" ]
    then
        echo "moving $file to dotfiles_old"
        mv ~/$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

if [ -f ~/.config/fish/config.fish ]
then
    mv ~/.config/fish/config.fish ~/dotfiles_old/
fi
ln -s $dir/config.fish ~/.config/fish/config.fish

if [ -f ~/.config/fish/functions/fin.fish ]
then
    mv ~/.config/fish/functions/fin.fish ~/dotfiles_old/
fi
ln -s $dir/fin/fin.fish ~/.config/fish/functions/fin.fish

if [ -f ~/.config/fish/bundle ]
then
    mv ~/.config/fish/bundle ~/dotfiles_old/
fi
ln -s $dir/bundle ~/.config/fish/bundle
