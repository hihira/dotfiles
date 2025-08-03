#!/bin/sh

ln -svni "$(pwd)"/.bashrc ~/
ln -svni "$(pwd)"/.bashrc_alias_"$(uname)" ~/
ln -svni "$(pwd)"/.bash_profile ~/
ln -svni "$(pwd)"/.vimrc ~/
ln -svni "$(pwd)"/.vimrc.bundle ~/
ln -svni "$(pwd)"/.vimrc.unite ~/
ln -svni "$(pwd)"/.vimrc.neocon ~/
ln -svni "$(pwd)"/.inputrc ~/
ln -svni "$(pwd)"/.ssh/config ~/.ssh/config
ln -svni "$(pwd)"/.gitconfig ~/
ln -svni "$(pwd)"/.git-completion.bash ~/
ln -svni "$(pwd)"/.git-prompt.sh ~/
mkdir ~/.vim/ ;         ln -svni "$(pwd)"/.vim/colors ~/.vim/
mkdir ~/.vim/ftplugin ; ln -svni "$(pwd)"/.vim/ftplugin/*.vim ~/.vim/ftplugin/
mkdir ~/.vim/syntax ;   ln -svni "$(pwd)"/.vim/syntax/*.vim ~/.vim/syntax/
