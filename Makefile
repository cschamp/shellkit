# Install dot-files in home directory
DST = $(HOME)
DSTNFS = $(HOME)/cschamp

SRC = .bash_profile .bashrc .emacs .emacs-asleep \
    .emacsd .exrc .gitconfig .hgrc .kshrc .tcshrc .vim .vimrc \
    .zlogin .zlogout .zsh .zsh.alias .zsh.console .zsh.function \
    .zsh.prompt .zshenv .zshrc

#ifeq (, $(shell which install))
 INSTALL = cp -RXpv
#else
 #INSTALL = install -CSv
#endif

all install:
	$(INSTALL) $(SRC) $(DST)

installNFS:
	$(INSTALL) $(SRC) $(DSTNFS)

import:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DST)/$$i . ;  done

importNFS:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DSTNFS)/$$i . ;  done

distro:
	tar -cvz -C .. -f ../shellkit.tgz --exclude .git shellkit

