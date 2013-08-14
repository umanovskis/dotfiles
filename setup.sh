#!/bin/bash

rm "$HOME"/.bashrc || true
rm "$HOME"/.bash_aliases || true

ln -s `pwd`/bash/.bashrc "$HOME"/.bashrc 
ln -s `pwd`/bash/.bash_aliases "$HOME"/.bash_aliases 

source `readlink -f "$HOME"/.bashrc`
source `readlink -f "$HOME"/.bash_aliases`

cp -r kde/* "$HOME"/.kde
