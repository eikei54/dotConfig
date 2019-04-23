#!/bin/sh

#
# execute this script in /home/<user>
#

rm .minttyrc
rm .gitconfig
rm .vimrc
rm .gvimrc
rm .bash_profile
rm .bash_functions
rm .gitignore
rm .tigrc
rm .tmux.conf
rm .agignore

# make symbolic link
ln -s ./dotConfig/_minttyrc .minttyrc
ln -s ./dotConfig/_gitconfig .gitconfig
ln -s ./dotConfig/_vimrc .vimrc
ln -s ./dotConfig/_gvimrc .gvimrc
ln -s ./dotConfig/_bash_profile .bash_profile
ln -s ./dotConfig/_bash_functions .bash_functions
ln -s ./dotConfig/_gitignore .gitignore
ln -s ./dotConfig/_tigrc .tigrc
ln -s ./dotConfig/_tmux.conf .tmux.conf
ln -s ./dotConfig/_agignore .agignore

