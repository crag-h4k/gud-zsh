# gud zsh

A pretty good zsh setup: oh-my-zsh + custom theme + hand-picked plugins,
wrapped so you can land on a new machine with one command.

## Table of Contents

- [Install](#install)
  - [Prereqs](#prereqs)
  - [One-shot bootstrap (new machine)](#one-shot-bootstrap-new-machine)
  - [Manual install](#manual-install)
- [Packages](#packages)
- [Symlink management](#symlink-management)
- [Plugins](#plugins)
- [Custom functions](#custom-functions)
  - [`zsh_history_backup`](#zsh_history_backup)
  - [`tf_log`](#tf_log)
- [Extras](#extras)
  - [`git boom` (fuzzy branch delete)](#git-boom-fuzzy-branch-delete)

## Install

### Prereqs

Debian / Ubuntu:

```sh
sudo apt install -y zsh git make
```

macOS:

```sh
# Homebrew (if missing)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install zsh zsh-completions zoxide fzf gh
```

### One-shot bootstrap (new machine)

Pull this repo, then run the bootstrap script. It clones all three dotfile
repos (`gud-zsh`, `gud-vim`, `gud-tmux`) and symlinks everything:

```sh
git clone --recursive https://github.com/crag-h4k/gud-zsh.git "$HOME/.zsh"
"$HOME/.zsh/bin/bootstrap"
sudo chsh -s "$(command -v zsh)"
```

### Manual install

If you only want the zsh repo:

```sh
git clone --recursive https://github.com/crag-h4k/gud-zsh.git "$HOME/.zsh"
make -C "$HOME/.zsh" install
sudo chsh -s "$(command -v zsh)"
```

Then open a new terminal or `exec zsh -l`.

## Packages

Install the system packages the shell + plugins expect (zsh, git, make, curl,
fzf, gh, zoxide, gnupg):

```sh
make packages
```

macOS uses Homebrew (install separately if missing). Debian/Ubuntu uses `apt`
and needs sudo. Safe to re-run: package managers skip anything already
installed. See `scripts/install-packages.sh` for the exact list.

## Symlink management

The repo ships a `Makefile` that manages all symlinks into `$HOME`:

```sh
make install     # idempotent: links ~/.zshrc and ~/.zshenv into this repo
make uninstall   # removes the managed symlinks
make relink      # uninstall + install
make check       # report status of each managed link
```

`make install` refuses to clobber real files: if `~/.zshrc` exists and is not
a symlink, it is left alone and the run skips that entry.

## Plugins

Current OMZ plugin list (see `zshrc`):

```text
aws, colored-man-pages, colorize, command-not-found, fzf, gpg-agent, gh,
git, jsontools, terraform, tmux, zoxide, zsh-completions,
zsh-autosuggestions, zsh-syntax-highlighting
```

Platform-specific additions:

- macOS: `macos`, `brew`
- Linux: `ssh-agent`

Conditionally loaded if `docker` is on `$PATH`: `docker`, `docker-compose`.

## Custom functions

Defined under `custom/functions/*.zsh` and auto-loaded from `zshrc`.

### `zsh_history_backup`

Copies `$HISTFILE` to `$ZSH_HISTORY_BACKUP_DIR` on interactive shell startup,
but only if the newest existing backup is older than
`ZSH_HISTORY_BACKUP_MIN_HOURS` (default 6). No files are ever deleted.

Defaults are wired in `zshrc`:

```zsh
export ZSH_HISTORY_BACKUP_DIR=$ZSH_BASE/zsh_history_backups
export ZSH_HISTORY_BACKUP_MIN_HOURS=6
zsh_history_backup
```

Override either variable in `~/.zsh_private` to change behavior per machine.

### `tf_log`

Sets Terraform logging env vars so the next `terraform` run writes a
timestamped debug log into the current directory.

## Extras

### `git boom` (fuzzy branch delete)

Requires [fzf](https://github.com/junegunn/fzf):

```sh
git branch --no-color | fzf -m | xargs -I {} git branch -D '{}'
```

`tab` to mark, `shift-tab` to unmark, `enter` to delete. Credit to
[@dteoh](https://github.com/dteoh/dotfiles/blob/master/git/commands/git-boom).
