#!/bin/bash
set -e
#oh-my-zsh:
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#homeshick:
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
#my dotfiles managed by homeshick:
git clone git://github.com/zed0/dotfiles.git $HOME/.homesick/repos/dotfiles
$HOME/.homesick/repos/homeshick/home/.homeshick link

#vundle (which should install the rest of the vim plugins):
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
