#!/bin/bash

rm "$HOME"/.bashrc || true
rm "$HOME"/.bash_aliases || true
rm "$HOME"/.vimrc || true

ln -s `pwd`/bash/.bashrc "$HOME"/.bashrc 
ln -s `pwd`/bash/.bash_aliases "$HOME"/.bash_aliases 
ln -s `pwd`/.vimrc "$HOME"/.vimrc

source `readlink -f "$HOME"/.bashrc`
source `readlink -f "$HOME"/.bash_aliases`

#The Plasma desktop file I definitely always want a backup of
cp "$HOME"/.kde/share/config/plasma-desktop-appletsrc "$HOME"/.kde/share/config/plasma-desktop-appletsrc.bak || true

cp -r kde/* "$HOME"/.kde
