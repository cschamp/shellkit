#
#         .bashrc (adapted from an old ksh startup script)
#							-- Craig Schamp
#
unset MAILCHECK

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=${PATH}:/Developer/Tools
PATH=${PATH}:/usr/local/pgsql/bin:/usr/local/mysql/bin
PATH=${PATH}:/build/trees/bin:/build/apps/bin
export PATH

MANPATH=/usr/local/pgsql/man:/usr/local/man:${MANPATH:="${HOME}/man:/usr/local/share/man:/usr/share/man"}
export MANPATH

# XXX PYTHONPATH=/usr/local/lib/python2.5/site-packages:$PYTHONPATH
# XXX export PYTHONPATH

#TERM=dtterm	;	export TERM
TERM=${TERM:-xterm}	;	export TERM

PAGER=/usr/bin/less	;	export PAGER
LESS="-m -s"		;	export LESS
MORE=-s			;	export MORE
CVSEDITOR=/usr/bin/vi	;	export CVSEDITOR
P4EDITOR=/usr/bin/vi	;	export P4EDITOR

. $HOME/.bashrc
