# Gud Vim

This is a pretty good zsh setup.

## Install

### Prereqs

Make sure vanilla zsh is already installed via system package manager.

#### For Debian GNU/Linux:

```sh
sudo apt install zsh -y
```

#### For macOS

If you don't have `homebrew` already installed, do it will the following command

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then install `zsh` via `brew`

```sh
brew install zsh
```

```sh
# back stuff up
BAK=$HOME/.zsh-$(date +%d-%b-%Y).bak
mkdir $BAK
mv $HOME/.zsh* $BAK/.
git clone https://github.com/git-gud-1/gud-zsh.git $HOME/.zsh --recursive
ln -s $HOME/.zsh/zshrc ~/.zshrc
ln -s $HOME/.zsh/zshenv ~/.zshenv
sudo chsh -s $(which zsh)
```

