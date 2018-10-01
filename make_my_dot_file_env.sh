#!/bin/sh

#
# execute this script in /home/<user>
#

rm .minttyrc
rm .gitconfig
rm .vimrc
rm .bash_profile
rm .gitignore
rm .tigrc
rm .tmux.conf

# make symbolic link
ln -s ./dotConfig/_minttyrc .minttyrc
ln -s ./dotConfig/_gitconfig .gitconfig
ln -s ./dotConfig/_vimrc .vimrc
ln -s ./dotConfig/_bash_profile .bash_profile
ln -s ./dotConfig/_gitignore .gitignore
ln -s ./dotConfig/_tigrc .tigrc
ln -s ./dotConfig/_tmux.conf .tmux.conf

