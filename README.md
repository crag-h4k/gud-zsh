# gud zsh

This is a pretty good zsh setup.

## Installation and Getting Started

Make sure vanilla zsh is already installed via system package manager.

### Debian GNU/Linux

```sh
sudo apt install zsh -y
```

### macOS

If you don't have `homebrew` already installed, do it will the following command

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then install `zsh` via `brew`

```sh
brew install zsh zsh-completions zsh-lovers
```

Install the *gud* zsh stuff

```sh
# back stuff up
BAK=$HOME/.zsh-$(date +%d-%b-%Y).bak
mkdir $BAK
mv $HOME/.zsh* $BAK/.
git clone https://github.com/crag-h4k/gud-zsh.git $HOME/.zsh --recursive
ln -s $HOME/.zsh/zshrc ~/.zshrc
ln -s $HOME/.zsh/zshenv ~/.zshenv
sudo chsh -s $(which zsh)
```

Then spawn a new shell by opening a new terminal session or by typing...

```sh
zsh
```

#### MacOS, update ruby

MacOS has a heinously out of date version of ruby. Install newer releases via
the commands below.

```zsh
brew install chruby ruby-install
ruby-install ruby
```

## Custom Functions and Scripts

### `tf_log`

This function sets terraform logging environment variables such that a log file
is created in the current directory with the current date and time as the filename
and sets the log level to `DEBUG`.

### `zsh_history_backup`

For `zsh_history_backup` - you can add these to your `~/.zshrc` for backing up
every time your spawn a shell and delete backups older than 30 days:

```zsh
# Enable zsh history backups, see custom/functions/zhist_backup
export ZSH_HISTORY_BACKUP_DIR=$ZSH_BASE/zsh_history_backups
export ZSH_HISTORY_BACKUP_MAX_DAYS=30
zsh_history_backup &> $ZSH_HISTORY_BACKUP_DIR/zsh_history_backup.log
```

### `git boom`

Credit to [@dteoh](https://github.com/dteoh/dotfiles/blob/master/git/commands/git-boom) for `git boom`.

# Delete multiple Git branches with a UI

This assumes you have installed [fzf](https://github.com/junegunn/fzf).

```
$ git branch --no-color | fzf -m | xargs -I {} git branch -D '{}'
```

Press `tab` to mark a branch, `shift-tab` to unmark. Press `enter` and all marked branches will be deleted.

## Add custom subcommand

You can add custom subcommands to git. Here's how I added the above script as `git boom`.

1. Create a file named `git-boom`. This file should be located inside of a directory in `$PATH` (either make a new directory and add it to $PATH, or use an existing location).
2. Add the script contents. Example from [my git-boom file][2].
3. Make the file executable. `chmod +x ./git-boom`
4. Now you can run `git boom`


[1]: https://github.com/junegunn/fzf
[2]: https://github.com/dteoh/dotfiles/blob/master/git/commands/git-boom
