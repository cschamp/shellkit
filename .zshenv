# paths

typeset -U path manpath fpath # no dupes
path=(~/bin ~/bin/checker /usr/local/bin $path)

fpath=(~/.zsh/functions $fpath)

export LESS='-R -q -i -s -c -M'

eval "$(/opt/homebrew/bin/brew shellenv)"
