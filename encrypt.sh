#!/bin/bash

if hash openssl 2>/dev/null; then
	#Encrypt additional files
	if [ -d `pwd`/bash/.bash_aliases.d ]; then
		shopt -s dotglob
		shopt -s nullglob
		for f in ./bash/.bash_aliases.d/* ; do
			ext=${f##*.}
			if [ "$ext" = "des3" ] || [ "$f" == ".gitignore" ]; then continue; fi
			encfile="$f".des3
			openssl des3 -salt -in "$f" -out "$encfile"
			if [ -f "$encfile" ]; then rm "$f"; fi
		done
	fi
else
	echo "OpenSSL not found, aborting"
	exit 1
fi
