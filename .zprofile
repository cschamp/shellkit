# Homebrew should precede legacy software in /usr/local, but run only after
# macOS has established its system and package paths in /etc/zprofile.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Personal commands deliberately have lower precedence than system and
# package-managed equivalents.
path=($path "$HOME/bin")
