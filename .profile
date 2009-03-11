# $Id: profile,v 1.13 2002/11/09 03:07:02 chs Exp $
umask 022

export LOGNAME
if [ "$LOGNAME" = "" ]
then
	LOGNAME=`whoami`
fi

export NODENAME	;	NODENAME="`uname -n`"
export SYSTEM	;	SYSTEM="`uname -s`"
export FCEDIT	;	FCEDIT=vi
export CDPATH	;	CDPATH=.:${HOME}
export CC	;	CC=gcc
export CXX	;	CXX=g++
#export MAILCHECK ;	MAILCHECK=31536000

export ISA
case $SYSTEM in 
SunOS*)
	ISA=`uname -p`
	;;
Darwin*)
	ISA=`uname -p`
	;;
*)
	ISA=`arch`
	;;
esac

export PAGER	;	PAGER=less
export EDITOR	;	EDITOR=vi
export ENV      ;	ENV=$HOME/.kshrc
export HISTFILE ;	HISTFILE=$HOME/.history.kshrc
export HISTSIZE	;	HISTSIZE=2048

export PS1	;	PS1="${ISA} $LOGNAME@${NODENAME}\\$ "

export ENSCRIPT	;	ENSCRIPT="-q"
export LESS	;	LESS="-q -i -s -c -M"
export MORE	;	MORE="-c -s"
export RNINIT	;	RNINIT="-e -m=u -S -/ -L -M +T -h +hart +hfrom +hkey +hdate +horg +hnewsgroup +hdistribution"

export PATH
PATH=/bin:/usr/bin:/usr/sbin:/sbin:/usr/ccs/bin:/usr/proc/bin:$PATH
PATH=/local/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=$HOME/bin:$HOME/bin/$ISA:$PATH

# export TERM ;	TERM=${TERM:-sun-cmd}

export MANPATH
MANPATH=/usr/share/man:/usr/man:/usr/local/man:$HOME/man

export P4EDITOR	;	P4EDITOR=/usr/bin/vi
export P4CLIENT
export P4USER
export P4PORT

case $NODENAME in
genoa)
	# galileo (AlterCast) repository
	P4CLIENT=${LOGNAME}_sol
	P4USER=$LOGNAME
	P4PORT='yorktown:1770'
	;;
*)
	# installer group's repository
	P4CLIENT=${LOGNAME}_mac
	P4USER=$LOGNAME
	P4PORT='redcloud:1700'
	;;
esac

case $SYSTEM in
SunOS*)
	export MAILER ; MAILER=/usr/bin/mailx
	PATH=$PATH:/usr/proc/bin:/usr/5bin
	PATH=$PATH:$HOME/bin/svr4
	PATH=$PATH:/usr/lib/lp/postscript
	PATH=$PATH:/usr/local/mysql/bin:/usr/local/apache/bin
	MANPATH=$MANPATH:/usr/local/mysql/man
	stty sane
	stty parenb tab3 erase '^H' kill '^U' intr '^C' werase '' echoe echok ixon -ixany ixoff
	;;
Darwin*)
	export MAILER ; MAILER=/usr/bin/mailx
	PATH=$PATH:/usr/proc/bin:/usr/5bin
	PATH=$PATH:$HOME/bin/svr4
	PATH=$PATH:/usr/lib/lp/postscript
	PATH=$PATH:/usr/local/mysql/bin:/usr/local/apache/bin
	MANPATH=$MANPATH:/usr/local/mysql/man
	stty sane
	stty parenb erase '^H' kill '^U' intr '^C' werase '' echoe echok ixon -ixany ixoff
	;;
*)
	echo "$HOME/.profile: Can't recognize SYSTEM=$SYSTEM"
	stty sane
	stty parenb erase '^H' kill '^U' intr '^C' werase '' echoe echok ixon -ixany ixoff
	;;
esac

PATH=$PATH:$OPENWINHOME/bin:$OPENWINHOME/demo
PATH=$PATH:/usr/ucb

case $SYSTEM in
SunOS*)
	# Sun OS 5.x. Assume we always have ksh.
	export SHELL	;	SHELL=/bin/ksh
	if [ "$0" != -ksh ]
	then
		echo 'shell is /bin/ksh'
		exec $SHELL
	fi
	;;
*)
	# For Sun OS 4.x and others Unixen, try to find ksh.
	if /bin/ksh -c 'echo shell is /bin/ksh' 2>/dev/null
	then
		export SHELL	;	SHELL=/bin/ksh
		exec $SHELL
	fi
	
	if /usr/local/bin/ksh -c 'echo shell is /usr/local/bin/ksh' 2>/dev/null
	then
		export SHELL	;	SHELL=/usr/local/bin/ksh
		exec $SHELL
	fi
	
	if $HOME/bin/ksh -c 'echo shell is $HOME/bin/ksh' 2>/dev/null
	then
		export SHELL	;	SHELL=$HOME/bin/ksh
		exec $SHELL
	fi
	
	echo 'shell is /bin/sh'
	export SHELL	;	SHELL=/bin/sh
	;;

esac
