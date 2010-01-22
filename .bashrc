#
#         .bashrc (adapted from an old ksh startup script)
#							-- Craig Schamp
# $Id: bashrc,v 1.1 2002/10/08 00:10:12 schamp Exp $
#
if [ -x /usr/bin/zsh ] ; then
    export SHELL=/usr/bin/zsh
    exec ${SHELL} -l
fi

export NODENAME
set notify
if [ -x /bin/uname ] ; then
	NODENAME="`/bin/uname -n`"
	ARCH="`/bin/uname -m`"
else
	NODENAME="`hostname`"
	ARCH="`arch`"
fi
if [ -x /usr/bin/arch ] ; then
    ARCH="`/usr/bin/arch`"
fi

PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=${PATH}:/Developer/Tools
PATH=${PATH}:/usr/local/pgsql/bin:/usr/local/mysql/bin
PATH=${PATH}:/build/trees/bin
export PATH

ami="${HOME}/projects/installers/InstallerDev/Mac/Main/AMI" ; export ami
installerdev="${HOME}/projects/installers/InstallerDev" ; export installerdev
scmdir="${HOME}/projects/installers/scm/Elements/Mac/Scripts/3.0" ; export scmdir
scm="${HOME}/projects/installers/scm" ; export scm
psdir="${HOME}/projects/installers/scm/Photoshop" ; export psdir
omdir="${HOME}/projects/installers/tools/overmind" ; export omdir

case "$-" in *i* ) INTERACTIVE=true ;; esac
if [ "$INTERACTIVE" = "true" ] ; then

    TTY=`tty`
    PS1="\[`tput bold`\]$ARCH \$DEPOT \u@\h\\$\[`tput rmso`\] "

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
    alias ls='ls -AGF'
    alias mroe=more
    alias mv='mv -i'
    alias j='jobs -l'

    psxgrep() {
		find ~/projects/psmake/PSMain/main -name '*.pbxproj' -or -name '*.xcconfig' -print0 | xargs -0 grep $1
	}

	ws() {
		case $1 in
		yorktown)
			export P4PORT=yorktown.corp.adobe.com:1700
			export P4CONFIG=${HOME}/.yorktown
			DEPOT="${P4PORT/.corp.adobe.com/}"
			;;
		redcloud)
			export P4PORT=redcloud.corp.adobe.com:1700
			export P4CONFIG=${HOME}/.redcloud
			DEPOT="${P4PORT/.corp.adobe.com/}"
			;;
		redcloud:1820)
			export P4PORT=redcloud.corp.adobe.com:1820
			export P4CONFIG=${HOME}/.redcloud-1820
			DEPOT="${P4PORT/.corp.adobe.com/}"
			;;
		redcloud:1850)
			export P4PORT=redcloud.corp.adobe.com:1850
			export P4CONFIG=${HOME}/.redcloud-1850
			DEPOT="${P4PORT/.corp.adobe.com/}"
			;;
		*)
			echo "Unknown workspace: $1"
			;;
		esac
	}

    if [ "${TERM##dtterm*}" = "" -o "${TERM##xterm*}" = "" -o "${TERM##vt*}" = "" -o "${TERM}" = "sa" -o "${TERM}" = "d0" ] ; then

	    # put $* in terminal window title bar
	    namestripe() {
			if [ "${#*}" = "0" ] ; then
				echo -n "]2;${NODENAME%%.corp.adobe.com}:${DIRSTACK[0]}"
			else
				echo -n "]2;${NODENAME%%.corp.adobe.com}:$*"
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

		build() {
			make $* >|errs 2>&1 &
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
