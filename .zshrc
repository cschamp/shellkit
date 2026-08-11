###################################
# Modules & Options
###################################

# modules
zmodload -i zsh/complist
zmodload -i zsh/parameter
_comp_setup+=$'\ntypeset -a userdirs'
zmodload -i zsh/mathfunc

# modes
autoload -U zed
autoload -U zmv
autoload -U edit-command-line
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U insert-files

# mailcheck
#mailpath=(/var/mail/${USERNAME})

# help
autoload run-help
alias run-help > /dev/null && unalias run-help

#options
       setopt append_history
       setopt NO_auto_cd
       setopt NO_auto_menu
       setopt auto_name_dirs
       setopt auto_pushd
       setopt autolist
       setopt bare_glob_qual
       setopt NO_beep
       setopt NO_check_jobs
       setopt NO_clobber
       setopt cdable_vars
       setopt complete_in_word
       setopt correct
       setopt extended_glob
       setopt extended_history
       setopt NO_flow_control
       setopt glob_complete
       setopt hash_cmds
       setopt hash_dirs
       setopt hist_allow_clobber
       setopt hist_ignore_space
       setopt hist_save_no_dups
       setopt hist_ignore_all_dups
       setopt hist_reduce_blanks
       setopt hist_verify
       setopt inc_append_history
       setopt ksh_option_print
       setopt list_packed
       setopt NO_list_rows_first
       setopt mark_dirs
       setopt NO_menucomplete
       setopt NO_multios
       setopt NO_nomatch
       setopt nohup
       setopt notify
       setopt path_dirs
       setopt NO_print_exit_value
       setopt pushd_ignore_dups
       setopt NO_pushd_minus
       setopt pushd_silent
       setopt pushd_to_home
       setopt rc_expand_param
       setopt rc_quotes
       setopt NO_singlelinezle
       setopt share_history

###################################
# Environment
###################################
#unset extensions # not sure why this is needed
typeset -xA extensions # this dictionary is also used by the lst() function
extensions=()
extensions[docs]="doc dvi html odf pdf pps ppt ps rtf tex txt xls xml pbxproj"
extensions[archives]="ace arj bz2 cdr deb dmg ear exe gz iso jar lzh pgdump rar rpm tar taz tgz udf war xpi z zip"
extensions[movies]="asf avi divx m1v m2v mov mp2 mp4 mpe mpeg mpg ram rm wmv xvid yuv"
extensions[audio]="au mp3 ogg wav wma"
extensions[pics]="bmp gif jpg pbm png ppm tga tif xbm xcf xpm"
extensions[code]="a bash c c++ class cpp cp elz jacl java ko jy m mm o out pl pm py pyc pyo sh so sql tcl zsh"

# add the uppercase extensions too
for key in ${(k)extensions[@]} ; do
  extensions[$key]="$extensions[$key] ${(U)extensions[$key]}"
done

LSCOLORS="Gxfxcxdxbxegedabagacad"
export LSCOLORS

# Associate colors and extensions.
  local -A colors
  colors=()
  colors[docs]="02;37"
  colors[archives]="01;31"
  colors[movies]="01;33"
  colors[audio]="00;33"
  colors[pics]="00;36"
  colors[code]="01;35"

  LS_COLORS='ex=01;35:no=00:fi=00;37:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=04;31'
#  LS_COLORS='no=00:fi=00;37:di=01;02;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=04;31'
  for key in ${(k)extensions[@]} ; do
    color=${colors[$key]}
    # join on '=${color}:.*', and prepend to LS_COLORS
    LS_COLORS='*.'${(ej,=${color}:*.,)${=${extensions[$key]}}}=${color}:$LS_COLORS
  done
  export LS_COLORS

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

DIRSTACKSIZE=50
if [[ -f ~/.zdirs ]] && [[ ${#dirstack[*]} -eq 0 ]]; then
    dirstack=( ${(uf)"$(< ~/.zdirs)"} )
    cd $dirstack[0] && cd - > /dev/null
fi
chpwd() { dirs -pl >! ~/.zdirs }

HELPDIR=~/.zsh/help

MAILCHECK=0

# logins/logouts watch
LOGCHECK=30 # in seconds
WATCH=all
WATCHFMT="[%D %T] %n has %a %l from %M"

WORDCHARS=

# misc
EDITOR_ZSH=(emacs -nw)
export EDITOR="/usr/bin/vim"
which less > /dev/null && export PAGER=less || export PAGER=more
export CVS_RSH=ssh
local -a javas ; javas=(/usr/local/j2*(DN))
if [[ ${#javas} -gt 0 ]] ; then
  export JAVA_HOME=$javas[-1]
  export JAVA=${JAVA_HOME}/bin/java
  path=($path $JAVA_HOME/bin)
fi
export XTERM="aterm-xterm -tr -sh 80 -fg White -bg Black -fn -jmk-neep-medium-r-normal--15-140-75-75-c-80-iso8859-15 -g 80x54 +sb -sl 10000 &"
#export XTERM="Eterm -O --color7 White -c White -f White -b Black --colors-suppress-bold false --font -jmk-neep-medium-r-normal--15-140-75-75-c-80-iso8859-15 --geometry 80x54 --scrollbar false -L 10000 --buttonbar false -w 1 &"

# generic zsh config files
ZSH_CONFIG_FILES=(~/.z(log|sh)^(_*|*~)(.) ~/.zsh/functions/_*)

# ulimit
limit coredumpsize 0 # don't allow coredumps

###################################
# Key bindings
###################################
bindkey -e
bindkey '^J' push-line
# bindkey '^W' kill-region

###################################
# Completion settings
###################################

# completion styles
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
[ -f ~/.ssh/known_hosts ] && zstyle ':completion:*:hosts' hosts `sed -e 's/[\,\ ].*//' ~/.ssh/known_hosts | xargs`
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:corrections' format '%B---- %d (errors %e)%b'
zstyle ':completion:*' verbose 'yes'
zstyle ':completion:*' file-sort name
zstyle ':completion:*' menu select=long

# completion for functions
compdef _connect-run connect run
compdef _cvs cvsseb
compdef _hosts dig digs
compdef '_deb_packages expl uninstalled' i
compdef _python-doc pydoc-html
compdef '_files -W $HELPDIR' run-help
compdef _smartsudo s
compdef _initd-service se
compdef _locales setlocale
compdef _which what

# colorizing kill and killall
zstyle ':completion:*:processes' command 'ps -U ${USER} -o pid,command'
zstyle ':completion:*:processes-names' command 'ps -U ${USER} -o command'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=0=01;32"
zstyle ':completion:*:*:kill:*:processes' sort false
zstyle ':completion:*:*:killall:*:processes-names' list-colors "=*=01;32"

###################################
# HOST/OSTYPE specificities
###################################

autoload -U promptinit
promptinit

PURE_CMD_MAX_EXEC_TIME=10

zstyle :prompt:pure:git:dirty detailed yes
zstyle :prompt:pure:path:separator dim yes
zstyle :prompt:pure:git:stash show yes

prompt pure

source ~/.zsh.alias

# OS specificities
case $OSTYPE in
  solaris*)
    path=(/opt/sfw/bin /opt/sfw/sbin /opt/csw/bin /opt/csw/sbin /usr/ucb /usr/ccs/bin /usr.local/bin /usr.local/sbin /usr.local/local/bin /usr.local/local/sbin $path)
    manpath=(/usr.local/man $manpath)
    export MANPATH
    [ -d /opt/csw/share/terminfo ] && export TERMINFO=/opt/csw/share/terminfo
    case $TERM in
      rxvt) export TERM=xterm ;;
      screen) who am i | grep -qv :S && export TERM=vt100 ;;
    esac ;;
  darwin*)
    [ "${TERM}" = "rxvt" ] && export TERM=xterm ;;
  *bsd*)
    if [[ $OSTYPE == openbsd* ]] ; then
      local o=usa.openbsd.org
      export CVSROOT=anoncvs@anoncvs3.$o:/cvs
      export PKG_PATH=ftp://ftp3.$o/pub/OpenBSD/`uname -r`/packages/i386
    fi ;;
esac

source ~/.zsh.function

# host specificities
case $HOST in
  yo)
    export XTERM=${XTERM/54/48}
    alias xterm="${XTERM}"
    source ~/.zsh_home ;;
  hop|foo)
    source ~/.zsh_home ;;
  bunsen|tical|shekuan|qbert|swift|*esg*|bar|foo|lingo|biggie|seb-mac|anderson|*matrix*|seb-mac*)
    source ~/.zsh_work ;;
  gluck)
    source ~/.zsh_debian ;;
  home|ob1)
    source ~/.zsh_private ;;
  sikout|cali)
    source ~/.zsh_work
    source ~/.zsh_home ;;
#  *)
#    \rm -fr ~/bin/mp3s ~/.sawfish ;;
esac

local hostFile=~/.zsh_$HOST
[[ -f $hostFile ]] && source $hostFile

haveNetwork && have keychain && keychain-init

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
