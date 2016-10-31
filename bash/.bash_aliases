untar()
{
fname=$(basename "$1")
ext="${fname##*.}"
if [[ $ext == gz ]]; then
	tar xzvf "$1"
elif [[ $ext == bz2 ]]; then
	tar xjvf "$1"
fi
}
alias x=untar

joinpdf()
{
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$1 -dBATCH "${@:2}"
}

change_extension()
{
rename \'s/\\."${1}"\$/"${2}"/\' "*."$1""
}
alias chext=change_extension

findbyname()
{
find . -name "$1"
}
alias findn=findbyname

alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade'
alias apt-install='sudo apt-get install'
alias reload='source ~/.bashrc || source ~/.bash_aliases'
alias mount='mount | column -t'
alias psgrep='ps aux | grep'
grepr()
{
grep -r "$1" .
}

playme()
{
python "$HOME"/ytplay/play.py "$1"
}

locatevim()
{
locate "$1" | tail -1 | xargs cat | vim -
}
alias locvim=locatevim

findnvim()
{
findn "$1" | tail -1 | xargs cat | vim -
}
alias rm='rm -I'

cat_or_pygmentize()
{
	if hash pygmentize 2> /dev/null; then
		pygmentize -g "$@"
	else
		/bin/cat "$@"
	fi
}
alias cat=cat_or_pygmentize

alias git-view-remote='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'

gitcd()
{
    if [ "$1" == "cd" ]; then
        git rev-parse --show-toplevel > /dev/null 2>&1   
        if [ $? == 0 ]; then
            cd `git rev-parse --show-toplevel`/"$2"
        fi
    else
        git "$@"
    fi
}
alias git=gitcd
