# paths
local usrlocal=/usr/local
typeset -U path manpath fpath # no dupes
path=(~/bin ~/bin/checker /build/trees/bin /build/apps/bin usrlocal/bin $usrlocal/sbin /usr/bin /usr/sbin /bin /sbin /Developer/usr/bin /usr/games /usr/bin/X11 $path)
manpath=(/usr/share/man /usr/local/man /usr/X11R6/man /opt/vmware/man $manpath)
export MANPATH
fpath=(~/.zsh/functions $fpath)
export LD_LIBRARY_PATH=/usr.local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/usr/local/lib/python2.5/site-packages:$PYTHONPATH
export P4CONFIG=.p4config
# XXX [[ -f /Applications/p4merge.app/Contents/MacOS/p4merge ]] && export P4DIFF=/Applications/p4merge.app/Contents/MacOS/p4merge
# [[ -f /usr/bin/chdiff ]] && export P4DIFF="/usr/bin/chdiff --wait"
# [[ -x ~/bin/gitchanges.sh ]] && export GIT_EXTERNAL_DIFF=~/bin/gitchanges.sh
