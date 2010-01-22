# Install dot-files in home directory
DST = $(HOME)
DSTNFS = $(HOME)/cschamp

SRC = .bash_profile .bashrc .emacs .emacs-asleep \
    .emacsd .exrc .hgrc .kshrc .profile .tcshrc .vim .zcompdump \
    .zlogin .zlogout .zsh .zsh.alias .zsh.console .zsh.function \
    .zsh.prompt .zshenv .zshrc

all install: 
	cp -Rvp $(SRC) $(DST)

installNFS:
	cp -Rvp $(SRC) $(DSTNFS)

import:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DST)/$$i . ;  done

importNFS:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DSTNFS)/$$i . ;  done

