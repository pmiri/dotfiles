#!/bin/bash
echo "source ~/.bashrc-extensions\n" | cat - ~/.bashrc > /tmp/out && mv /tmp/out ~/.bashrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install fortune cowsay tmux vim
