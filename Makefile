REPO_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
HOME_DIR ?= $(HOME)

# LINKS format: "<path-in-repo>:<path-under-$HOME>"
LINKS := \
  zshrc:.zshrc \
  zshenv:.zshenv

.PHONY: install uninstall relink check packages help

help:
	@echo "Targets:"
	@echo "  packages   install system packages (brew on macOS, apt on Debian)"
	@echo "  install    symlink tracked files into \$$HOME (idempotent)"
	@echo "  uninstall  remove the symlinks this Makefile manages"
	@echo "  relink     uninstall then install"
	@echo "  check      report which managed symlinks are present and correct"

packages:
	@$(REPO_DIR)/scripts/install-packages.sh

install:
	@set -eu; for link in $(LINKS); do \
	  src="$(REPO_DIR)/$${link%%:*}"; \
	  dst="$(HOME_DIR)/$${link##*:}"; \
	  mkdir -p "$$(dirname "$$dst")"; \
	  if [ -e "$$dst" ] && [ ! -L "$$dst" ]; then \
	    echo "SKIP $$dst (real file, not a symlink; remove it first)"; \
	    continue; \
	  fi; \
	  ln -sfn "$$src" "$$dst"; \
	  echo "LINK $$dst -> $$src"; \
	done

uninstall:
	@for link in $(LINKS); do \
	  dst="$(HOME_DIR)/$${link##*:}"; \
	  if [ -L "$$dst" ]; then rm -v "$$dst"; fi; \
	done

relink: uninstall install

check:
	@for link in $(LINKS); do \
	  dst="$(HOME_DIR)/$${link##*:}"; \
	  src="$(REPO_DIR)/$${link%%:*}"; \
	  if [ "$$(readlink "$$dst" 2>/dev/null)" = "$$src" ]; then \
	    echo "OK   $$dst"; \
	  else \
	    echo "MISS $$dst"; \
	  fi; \
	done
