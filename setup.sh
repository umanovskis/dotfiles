#!/bin/bash

rm "$HOME"/.bashrc > /dev/null || true
rm "$HOME"/.bash_aliases > /dev/null || true 
rm "$HOME"/.vimrc > /dev/null || true


shopt -s nullglob

if hash openssl 2>/dev/null; then
	#Decrypt additional files
	if [ -d `pwd`/bash/.bash_aliases.d ]; then
		for encfile in ./bash/.bash_aliases.d/*.des3 ; do
			fname=$(basename "$encfile")
			decfile="./bash/.bash_aliases.d/${fname%.*}"
			echo "$decfile"
			openssl des3 -d -salt -in "$encfile" -out "$decfile"
			if [ -f "$decfile" ]; then rm "$encfile"; fi
		done
	fi
else
	echo "OpenSSL not found, additional aliases will not be decrypted"
fi

ln -s `pwd`/bash/.bashrc "$HOME"/.bashrc 
ln -s `pwd`/bash/.bash_aliases "$HOME"/.bash_aliases
if ! [ -L "$HOME"/.bash_aliases.d ]; then
	ln -s `pwd`/bash/.bash_aliases.d "$HOME"/.bash_aliases.d
fi

ln -s `pwd`/.vimrc "$HOME"/.vimrc

source `readlink -f "$HOME"/.bashrc`
source `readlink -f "$HOME"/.bash_aliases`

#The Plasma desktop file I definitely always want a backup of
cp "$HOME"/.kde/share/config/plasma-desktop-appletsrc "$HOME"/.kde/share/config/plasma-desktop-appletsrc.bak || true

cp -r kde/* "$HOME"/.kde
cp -r config/* "$HOME"/.config
