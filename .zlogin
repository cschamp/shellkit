local wai="`who am i`" # this is used several times, make it a local variable

# remapping a few keys
source ~/.zsh.console


# the following line cannot be in zshenv since 'who am i' requires a tty
#export LOGIN_HOST=`who am i | awk '{print $6}' | sed -e 's/[()]//g'`
export LOGIN_HOST=${${=wai}[5]//[()]}

#if [[ -n $LOGIN_HOST ]] && [[ $LOGIN_HOST != $HOST ]] ; then
#  # start screen if it's version 4.x only
#  have screen && [[ ${$(screen -v)[3]} == 4* ]] && [[ $TERM != (screen|vt100) ]] && [[ $HOST != cali ]] && echo $DISPLAY >| ~/.screen-display  && screen -R -D -A -S main
#  # at this point screen is started, let's see if it's running our usual programs
#  if [[ $HOST == foo ]] && ! psg mutt && ! psg centericq ; then
#    screen 1 mutt
#    screen 2 centericq
#    screen 3 slrn
#    screen 4 irssi
#    screen 5 zsh
#    screen 6 zsh
#    screen 7 zsh
#  fi
#fi
