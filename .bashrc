#
#         .bashrc (adapted from an old ksh startup script)
#							-- Craig Schamp
export NODENAME
if [ -x /bin/uname ] ; then
	case "`/bin/uname -s`" in
	Darwin)
		NODENAME="`/bin/uname -n`"
		ARCH="`/usr/bin/arch`"
		;;
	Linux)
		NODENAME="`/bin/uname -n`"
		ARCH="`/bin/uname -m`"
		;;
	*)
		NODENAME="`/bin/uname -n`"
		ARCH="`/usr/bin/arch`"
		;;
	esac
else
	NODENAME="`hostname`"
	ARCH="`arch`"
fi

# fink init
# . /sw/bin/init.sh

case "$-" in *i* ) INTERACTIVE=true ;; esac
if [ "$INTERACTIVE" = "true" ] ; then

    TTY=`tty`
#    PS1="$ARCH $SHLVL \u@\h\\$ "
    PS1="\u@\h \t\\$ "

    set -h
#    set -o vi
    set -o ignoreeof
    set -o noclobber

    shopt -s histappend

    alias bc="bc -l"
    alias cp='cp -i'
    alias diff="diff -b"
    alias h='fc -l'
    alias history='fc -l'
    alias ls='ls -AFG'
    alias mroe=more
    alias mv='mv -i'
    alias j='jobs -l'
    alias ssh-hm="ssh cschamp@${BLOGHOST}"
    alias sftp-hm="sftp cschamp@${BLOGHOST}"
    if [ "${TERM##dtterm*}" = "" -o "${TERM##xterm*}" = "" -o "${TERM##vt*}" = "" -o "${TERM}" = "sa" -o "${TERM}" = "d0" ] ; then

	    # put $* in terminal window title bar
	    namestripe() {
		if [ "${#*}" = "0" ] ; then
			echo -n "]2;${DIRSTACK[0]}"
		else
			echo -n "]2;$*"
		fi
	    }

	    chdir() {
		if [ "${#*}" = "0" ] ; then
			cd
		else
			cd "$*"
		fi
		namestripe
	    }
	    pp() {
		popd
		namestripe
	    }
	    pd() {
		pushd "$*"
		namestripe
	    }

	    alias cd=chdir
	    namestripe
    fi

    epr2() {
	enscript -2GrE -p - $* | atprint
    }

    epr() {
	enscript -GE -p - $* | atprint
    }

    # not a shelltool shell
else
# not interactive
	PS1="$NODENAME$ " ; export PS1
fi

