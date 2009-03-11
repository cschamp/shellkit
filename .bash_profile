#
#         .bashrc (adapted from an old ksh startup script)
#							-- Craig Schamp
unset MAILCHECK

TERM=dtterm ; export TERM

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Developer/Tools
export PATH

MANPATH=/usr/local/man:${MANPATH:="${HOME}/man:/usr/local/share/man:/usr/share/man"}
export MANPATH

PAGER=/usr/bin/less	;	export PAGER
LESS="-m -s"		;	export LESS
MORE=-s			;	export MORE
CVSROOT=/usr/local/cvsrep ;	export CVSROOT
CVSEDITOR=/usr/bin/vi	;	export CVSEDITOR
#BLOGHOST=zephyros.hmdns.net ;	export BLOGHOST
BLOGHOST=hecate.hmdnsgroup.com ;	export BLOGHOST
EDITOR=$HOME/bin/bbe	;	export EDITOR

P4EDITOR=/usr/bin/vi	;	export P4EDITOR
P4CLIENT=schamp_home	;	export P4CLIENT
P4USER=schamp		;	export P4USER
P4PORT='redcloud.corp.adobe.com:1700'	;	export P4PORT

. $HOME/.bashrc
