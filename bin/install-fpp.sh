#!/bin/bash

set -eu

mkdir -p $HOME/git && cd $HOME/git
git clone https://github.com/facebook/PathPicker.git
cd PathPicker
mkdir -p $HOME/bin && ln -s "$(pwd)/fpp" ~/bin/fpp
