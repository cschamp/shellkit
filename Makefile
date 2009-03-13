# Install dot-files in home directory
DST = $(HOME)

SRC = .bash_profile .bashrc .emacs .emacs-asleep .emacs.d \
    .emacsd .exrc .kshrc .profile .tcshrc .vim .zcompdump \
    .zlogin .zlogout .zsh .zsh.alias .zsh.console .zsh.function \
    .zsh.prompt .zshenv .zshrc

all: 
	cp -Rvp $(SRC) $(DST)

