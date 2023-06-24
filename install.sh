#!/bin/sh

# Install the configs
ln -s $HOME/.configs/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.configs/dotfiles/chadwm $HOME/.configs/
ln -s $HOME/.configs/dotfiles/neofetch $HOME/.configs/
ln -s $HOME/.configs/dotfiles/ranger $HOME/.configs/
ln -s $HOME/.configs/dotfiles/rofi $HOME/.configs/
ln -s $HOME/.configs/dotfiles/alacritty $HOME/.configs/
ln -s $HOME/.configs/dotfiles/starship.toml $HOME/.configs/
fol=`ls $HOME/.local|grep bin`

if fol; then
     ln -s $HOME/.configs/dotfiles/bin/* $HOME/.local/bin
else
    mkdir $HOME/.local/bin
    ln -s $HOME/.configs/dotfiles/bin $HOME/.local
fi

