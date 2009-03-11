#
# $Id: kshrc,v 1.10 2002/11/09 03:20:08 chs Exp chs $
#
#         .kshrc

case "$-" in *i* ) INTERACTIVE=true ;; esac
if [ "$INTERACTIVE" = "true" ]; then # proceed only if an interactive shell

    TTY=`tty`

    if [ "$TTY" = "/dev/console" ]; then
    	read answer?"Do you want to run open-windows? "
    	if [ $answer = y ]; then
    		exec $OPENWINHOME/bin/openwin
    	fi
    fi

    NODENAME=${NODENAME%%.corp.adobe.com}
    NODENAME=${NODENAME%%.local.}
    export PS1	;	PS1="${ISA} $LOGNAME@${NODENAME}\\$ "

    BLOGHOST=zephyros.hmdns.net ;	export BLOGHOST
    alias ssh-hm="ssh cschamp@${BLOGHOST}"
    alias sftp-hm="sftp cschamp@${BLOGHOST}"

    set -h
    set -o emacs
    set -o nolog
    set -o ignoreeof
    set -o noclobber

    alias bc='bc -l'
    alias cp='cp -i'
    alias diff='diff -b'
    alias epr='enscript -G'
    alias epr2='enscript -2Gr'
    alias h='fc -l'
    alias history='fc -l'
    alias lineprint='enscript -2GrCH5'
    alias ls='ls -F'
    alias mail=mailx
    alias Mail=mailx
    alias mroe=more
    alias mv='mv -i'
    alias psman='man -t'
    alias r=rlogin
    alias j='jobs -l'
    #alias locks='sccs tell'
    alias locks='rlog -L -R -l RCS/*,v'
    #alias xlscolor='more /usr/openwin/lib/X11/rgb.txt'
    # Following two aliases are from Adobe IS
    alias ts='set noglob ; eval `tset -Q -s \!*`; unset noglob'
    alias rme='/bin/rm -f - *CKP *BAK *% .*% .*BAK .*CKP .emacs_[0-9]*'

    alias gweblogs="egrep -v '(default.ida|winnt|\.exe)' /usr/local/apache/logs/access_log"

    export acastdir ; acastdir="$HOME/projects/galileo/b2b/demo.1/product/altercast/installer"

    psman() {
	tbl $* | troff -man -Tpost -t - | /usr/lib/lp/postscript/dpost
    }

    build() { make $* >| errs 2>&1 & }

    VG=/bin/vgrind ; export VG
    if [ ! -x $VG ] ; then VG=/usr/ucb/vgrind ; fi
    vgrind() {
	$VG -t -Tpost $* | dpost
    }
    lineprint() {
	enscript -2GrCH5 $*
    }

    #----------------------------------------------------------
    # proceed only if a shelltool or xterm shell 

    if [ "$WINDOW_PARENT" != "" -o "${TERM##sun-cmd}" = "" -o "${TERM##xterm*}" = "" -o "${TERM##vt*}" = "" -a "$TTY" != "/dev/console" ] ; then

	    # A couple of fun functions

	    if [ "${TERM##sun*}" = "" ]; then
		    # put $* in icon's stripe
		    iconstripe() {
			    if [ "${#*}" = "0" ]; then
				    print -n "]L${NODENAME}\\";
			    else
				    print -n "]L$*\\";
			    fi
		    }
		    # put $* in shelltool's stripe
		    namestripe() {
			    if [ "${#*}" = "0" ]; then
				    print -n "]l<${NODENAME}> $PWD\\";
			    else
				    print -n "]l$*\\";
			    fi
		    }
	    elif [ "${TERM##dtterm*}" = "" -o "${TERM##xterm*}" = ""  -o "${TERM##vt*}" = "" ]; then
		    # for Nifty Telnet (and others?) we don't want iconstripe.
		    iconstripe() { true; }
		    # put $* in shelltool's stripe
		    namestripe() {
			if [ "${#*}" = "0" ]; then
				print -n "]2;<${NODENAME}> $PWD";
			else
				print -n "]2;$*";
			fi
		    }
	    fi

	    chdir() { cd "$*" ; namestripe ; iconstripe ; }
	    alias cd=chdir
	    namestripe
	    iconstripe
    fi
    # not a shelltool shell
else
# not interactive
	PS1="$NODENAME$ " ; export PS1
fi
