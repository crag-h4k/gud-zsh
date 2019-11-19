#!/bin/bash
echo "#" > $HOME/.zshrc
echo "#" > /home/$SUDO_USER/.zshrc

chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER

rsync -a * /etc/zsh/.

if [ ! -f /etc/zsh/oh-my-zsh/themes/bolverk.zsh-theme ]; then
  ln -f /etc/zsh/bolverk.zsh-theme /etc/zsh/oh-my-zsh/themes/bolverk.zsh-theme
fi
