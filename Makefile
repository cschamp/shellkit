# Install dot-files in home directory
DST = $(HOME)
DSTNFS = $(HOME)/cschamp

SRC = .bash_profile .bashrc .emacs .emacs-asleep \
    .emacsd .exrc .gitconfig .hgrc .kshrc .tcshrc .vim \
    .zlogin .zlogout .zsh .zsh.alias .zsh.console .zsh.function \
    .zsh.prompt .zshenv .zshrc

all install: 
	cp -Rvp $(SRC) $(DST)

installNFS:
	cp -RXpv $(SRC) $(DSTNFS)

import:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DST)/$$i . ;  done

importNFS:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DSTNFS)/$$i . ;  done

distro:
	tar -cvz -C .. -f ../shellkit.tgz --exclude .git shellkit

