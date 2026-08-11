# Keep zsh's path arrays free of duplicate entries. Executable-path
# initialization belongs in .zprofile, after macOS has run path_helper.
typeset -U path fpath

# Let man derive its search path from the executable path and macOS defaults.
unset MANPATH

# Ignore completions left by the retired Intel Homebrew installation. Personal
# functions deliberately follow the remaining system and vendor functions.
fpath=(${fpath:#/usr/local/share/zsh/site-functions} "$HOME/.zsh/functions")

export LESS='-R -q -i -s -c -M -X'
