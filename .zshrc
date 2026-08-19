###################################
# Modules, completion, and options
###################################

zmodload -i zsh/complist

autoload -Uz add-zsh-hook colors compinit promptinit run-help
compinit
colors
unalias run-help 2>/dev/null

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
# Environment and history
###################################

export LSCOLORS='Gxfxcxdxbxegedabagacad'

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$HOME/.zsh_history

DIRSTACKSIZE=50
if [[ -f $HOME/.zdirs ]] && (( ${#dirstack} == 0 )); then
  dirstack=( ${(uf)"$(< $HOME/.zdirs)"} )
  builtin cd -- "$dirstack[0]" && builtin cd - >/dev/null
fi

_shellkit_save_dirstack() {
  dirs -pl >! "$HOME/.zdirs"
}
add-zsh-hook chpwd _shellkit_save_dirstack

WORDCHARS=
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL

if (( $+commands[less] )); then
  PAGER=less
else
  PAGER=more
fi
export PAGER

limit coredumpsize 0

###################################
# Key bindings and completion
###################################

bindkey -e
bindkey '^J' push-line

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:corrections' format '%B---- %d (errors %e)%b'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' file-sort name
zstyle ':completion:*' menu select=long
zstyle ':completion:*:processes' command 'ps -U ${USER} -o pid,command'
zstyle ':completion:*:processes-names' command 'ps -U ${USER} -o command'
zstyle ':completion:*:*:kill:*:processes' sort false
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=*=01;32'

###################################
# Prompt and interactive helpers
###################################

promptinit
if (( $+functions[prompt_pure_setup] )); then
  PURE_CMD_MAX_EXEC_TIME=10
  zstyle :prompt:pure:git:dirty detailed yes
  zstyle :prompt:pure:path:separator dim yes
  zstyle :prompt:pure:git:stash show yes
  zstyle :prompt:pure:path color 033
  prompt pure
else
  PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
fi

source "$HOME/.zsh.alias"
source "$HOME/.zsh.function"

# Syntax highlighting must be loaded after aliases, functions, and widgets.
typeset _shellkit_highlighter
for _shellkit_highlighter in \
  "${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
do
  if [[ -r $_shellkit_highlighter ]]; then
    source $_shellkit_highlighter
    break
  fi
done
unset _shellkit_highlighter
