# Keep zsh's path arrays free of duplicate entries. Executable-path
# initialization belongs in .zprofile, after macOS has run path_helper.
typeset -U path fpath

# Ignore broken completions left by the retired Intel Homebrew installation on
# this Apple Silicon Mac. Do not suppress that path on systems that use it.
if [[ $OSTYPE == darwin* && -x /opt/homebrew/bin/brew ]]; then
  fpath=(${fpath:#/usr/local/share/zsh/site-functions})
elif [[ -d "$HOME/.zsh/pure" ]] ; then
  fpath=("$HOME/.zsh/pure" ${fpath:#/usr/local/share/zsh/site-functions})
fi

# Let man derive its search path from the executable path and macOS defaults.
unset MANPATH

export LESS='-R -q -i -s -c -M -X'
