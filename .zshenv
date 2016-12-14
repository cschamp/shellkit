# paths
local usrlocal=/usr/local
typeset -U path manpath fpath # no dupes
path=(~/bin ~/bin/checker usrlocal/bin $usrlocal/sbin /usr/bin /usr/sbin /bin /sbin /Developer/usr/bin /usr/local/bin /build/trees/bin /build/apps/bin /usr/games /usr/bin/X11 $path /Applications/Postgres.app/Contents/Versions/latest/bin)
fpath=(~/.zsh/functions $fpath)
export P4CONFIG=.p4config
[[ -x ~/bin/gitchanges.sh ]] && export GIT_EXTERNAL_DIFF=~/bin/gitchanges.sh
export GITHUB_USER=cschamp
#export GITHUB_TOKEN=
export LESS="-q -i -s -c -M"
