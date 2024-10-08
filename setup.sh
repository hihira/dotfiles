#!/usr/bin/env bash

type git || exit 1

if [ "${BASH_SOURCE:-$0}" != './setup.sh' ]; then
  GIT_REPOS="git@github.com:hihira/dotfiles.git"
  mkdir ~/git/
  cd ~/git/ || exit
  git clone $GIT_REPOS
  cd ~/git/dotfiles || exit
fi

ln -svni "$(pwd)"/.bashrc ~/
ln -svni "$(pwd)"/.bashrc_alias_"$(uname)" ~/
ln -svni "$(pwd)"/yenv/bash/.bashrc_yenv ~/
ln -svni "$(pwd)"/.bash_profile ~/
ln -svni "$(pwd)"/.vimrc ~/
ln -svni "$(pwd)"/.vimperatorrc ~/
ln -svni "$(pwd)"/.vimrc.bundle ~/
ln -svni "$(pwd)"/.vimrc.unite ~/
ln -svni "$(pwd)"/.vimrc.neocon ~/
ln -svni "$(pwd)"/.inputrc ~/
ln -svni "$(pwd)"/.gitconfig ~/
ln -svni "$(pwd)"/.git-completion.bash ~/
ln -svni "$(pwd)"/.git-prompt.sh ~/
mkdir -p ~/.ssh/ ;               ln -svni "$(pwd)"/.ssh/config ~/.ssh/config
mkdir ~/bin/ ;                   ln -svni "$(pwd)"/bin/git_diff_wrapper.sh ~/bin/
mkdir ~/.vim/ ;                  ln -svni "$(pwd)"/.vim/{colors,filetype.vim} ~/.vim/
mkdir ~/.vim/ftplugin ;          ln -svni "$(pwd)"/.vim/ftplugin/*.vim ~/.vim/ftplugin/
mkdir -p ~/.vim/after/ftplugin ; ln -svni "$(pwd)"/.vim/after/ftplugin/*.vim ~/.vim/after/ftplugin/
mkdir ~/.vim/syntax ;            ln -svni "$(pwd)"/.vim/syntax/*.vim ~/.vim/syntax/
                                 ln -svni "$(pwd)"/yenv/vim/syntax/*.vim ~/.vim/syntax/
mkdir -p ~/var/vim/undo
mkdir -p ~/var/vim/tmp

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

if ! ack --version > /dev/null 2>&1 ; then
  curl https://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 755 ~/bin/ack
fi

exit 0
