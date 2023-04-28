# gud zsh

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

#### MacOS, update ruby

MacOS has a heinously out of date version of ruby. Install newer releases via
the commands below.

```zsh
brew install chruby ruby-install
ruby-install ruby

```
