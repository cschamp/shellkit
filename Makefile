# Install dot-files in a destination directory.
DST ?= $(HOME)

SRC = .bash_profile .bashrc .gitconfig .vim .vimrc .zprofile .zsh \
    .zsh.alias .zsh.function .zshenv .zshrc

# Historical reference only; intentionally not deployed: .profile .zsh.prompt

.PHONY: all install preflight force-install import importNFS distro

define deploy_files
	@set -eu; \
	for item in $(SRC); do \
	  if [ -d "$$item" ]; then \
	    find "$$item" -type d -print | while IFS= read -r dir; do \
	      mkdir -p "$(DST)/$$dir"; \
	    done; \
	    find "$$item" -type f -print | while IFS= read -r file; do \
	      echo "$$file"; \
	      cp -pv "$$file" "$(DST)/$$file"; \
	    done; \
	  else \
	    echo "$$item"; \
	    mkdir -p "$(DST)/$$(dirname "$$item")"; \
	    cp -pv "$$item" "$(DST)/$$item"; \
	  fi; \
	done
endef

all: install

# Refuse to overwrite a destination file when it differs from its repository
# counterpart and has a newer modification time. Directories are expanded and
# checked file by file so one locally edited file cannot hide in a directory.
preflight:
	@set -eu; \
	{ \
	  for item in $(SRC); do \
	    if [ -d "$$item" ]; then \
	      find "$$item" -type f -print; \
	    else \
	      printf '%s\n' "$$item"; \
	    fi; \
	  done; \
	} | ( \
	  status=0; \
	  while IFS= read -r repo; do \
	    dest="$(DST)/$$repo"; \
	    if [ -L "$$dest" ]; then \
	      echo "preflight: destination is a symbolic link: $$dest" >&2; \
	      status=1; \
	    elif [ -e "$$dest" ] && [ ! -f "$$dest" ]; then \
	      echo "preflight: destination is not a regular file: $$dest" >&2; \
	      status=1; \
	    elif [ -f "$$dest" ] && ! cmp -s "$$repo" "$$dest" \
	        && [ "$$dest" -nt "$$repo" ]; then \
	      echo "preflight: newer differing destination file: $$dest" >&2; \
	      status=1; \
	    fi; \
	  done; \
	  if [ "$$status" -ne 0 ]; then \
	    echo "preflight: installation stopped; review the files above." >&2; \
	    echo "preflight: use 'make force-install' only to overwrite them explicitly." >&2; \
	  fi; \
	  exit "$$status"; \
	)

install: preflight
	$(deploy_files)

force-install:
	@echo "force-install: bypassing divergence preflight for $(DST)" >&2
	$(deploy_files)

import:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DST)/$$i . ;  done

importNFS:
	for i in $(SRC) ; do echo $$i ; cp -Rvp $(DSTNFS)/$$i . ;  done

distro:
	tar -cvz -C .. -f ../shellkit.tgz --exclude .git shellkit
