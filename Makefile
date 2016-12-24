# Install dot-files in home directory
DST = $(HOME)

SRC = .bash_profile .bashrc .emacs .emacs-asleep \
    .emacsd .exrc .gitconfig .hgrc .kshrc .tcshrc .vim .vimrc \
    .zlogin .zlogout .zsh .zsh.alias .zsh.console .zsh.function \
    .zsh.prompt .zshenv .zshrc

INSTALL = cp -RXpv

all install:
	-for i in $(SRC) ; do echo $$i ; cp -Rvp $$i $(DST)/$$i ;  done

import:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DST)/$$i . ;  done

importNFS:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DSTNFS)/$$i . ;  done

distro:
	tar -cvz -C .. -f ../shellkit.tgz --exclude .git shellkit

