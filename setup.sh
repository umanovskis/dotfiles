#!/bin/bash

function link()
{
	if ! [ -e "$1" ]; then
		echo "$1 does not exist, skipping"
	fi
	ln -s ${1} ${2}
}

mapfile -t CONFARR < <(cat conf | grep -v "^#")

for entry in ${CONFARR[@]}; do
	src=${entry##*:}
	dst=~/${entry%%:${src}}
	src=`pwd`/${src}
	if [ -e "$dst" ]; then
		target=`readlink "$dst"`
		if [ "$target" == "$src" ]; then
			echo "Link $dst up-to-date, skipping..."
			continue
		fi
	fi
#	echo $dst
	link "$src" "$dst"
done


if hash openssl 2>/dev/null; then
	#Decrypt additional files
	if [ -d `pwd`/bash/.bash_aliases.d ]; then
		for encfile in ./bash/.bash_aliases.d/*.des3 ; do
			fname=$(basename "$encfile")
			decfile="./bash/.bash_aliases.d/${fname%.*}"
			openssl des3 -d -salt -in "$encfile" -out "$decfile"
			# If it failed due to wrong decryption key...
			# the decrypted file is just crap
			if [ "$?" -eq 1 ]; then
				rm "$decfile"
			fi
		done
	fi
else
	echo "OpenSSL not found, additional aliases will not be decrypted"
fi

