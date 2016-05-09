.PHONY: all default help list update

DOTFILES = .aliases .bash_profile .bash_prompt .bashrc .editorconfig .exports .functions .gitconfig .gvimrc .tmux.conf .vimrc

all: update install

default: install

install:
	/bin/ln -sfnv $(CURDIR)/.aliases $(HOME)/.aliases
	/bin/ln -sfnv $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	/bin/ln -sfnv $(CURDIR)/.bash_prompt $(HOME)/.bash_prompt
	/bin/ln -sfnv $(CURDIR)/.bashrc $(HOME)/.bashrc
	/bin/ln -sfnv $(CURDIR)/.csw $(HOME)/.csw
	/bin/ln -sfnv $(CURDIR)/.tmux.conf $(HOME)/.byobu/.tmux.conf
	/bin/ln -sfnv $(CURDIR)/.editorconfig $(HOME)/.editorconfig
	/bin/ln -sfnv $(CURDIR)/.exports $(HOME)/.exports
	/bin/ln -sfnv $(CURDIR)/.functions $(HOME)/.functions
	/bin/ln -sfnv $(CURDIR)/.gitconfig $(HOME)/.gitconfig
	/bin/ln -sfnv $(CURDIR)/.gvimrc $(HOME)/.gvimrc
	/bin/ln -sfnv $(CURDIR)/.vimrc $(HOME)/.vimrc

help:
	@echo ""
	@echo "Usage:"
	@echo ""
	@echo "make list	-- Show dotfiles in this repository"
	@echo "make update	-- Fetch changes/updates for this repository"
	@echo "make install	-- Install dotfiles"
	@echo ""

list:
	@echo ""
	@echo "List of dotfiles in this repository:"
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)
	@echo ""

update:
	git pull origin master
