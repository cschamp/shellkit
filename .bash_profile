#
#         .bashrc (adapted from an old ksh startup script)
#							-- Craig Schamp
# $Id: bash_profile,v 1.7 2003/03/07 21:39:15 schamp Exp $
#
unset MAILCHECK

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=${PATH}:/Developer/Tools
PATH=${PATH}:/usr/local/pgsql/bin:/usr/local/mysql/bin
PATH=${PATH}:/build/trees/bin
export PATH

MANPATH=/usr/local/pgsql/man:/usr/local/man:${MANPATH:="${HOME}/man:/usr/local/share/man:/usr/share/man"}
export MANPATH

PYTHONPATH=/usr/local/lib/python2.5/site-packages:$PYTHONPATH
export PYTHONPATH

#TERM=dtterm	;	export TERM
TERM=${TERM:-xterm}	;	export TERM

PAGER=/usr/bin/less	;	export PAGER
LESS="-m -s"		;	export LESS
MORE=-s			;	export MORE
CVSEDITOR=/usr/bin/vi	;	export CVSEDITOR
P4EDITOR=/usr/bin/vi	;	export P4EDITOR
P4USER=schamp			;	export P4USER

. $HOME/.bashrc
