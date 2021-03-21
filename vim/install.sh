#!/bin/sh
#
# Vim plugins
#
# This installs some of the common dependencies needed (or at least desired)
# using Voom.

# Check for Voom
if test ! $(which voom)
then
  echo "  Installing Voom for you."
  curl -LSso ~/.dotfiles/bin/voom https://raw.githubusercontent.com/airblade/voom/master/voom
  chmod 755 ~/.dotfiles/bin/voom
fi

# Install plugins via voom
~/.dotfiles/bin/voom

# Post-install steps
pushd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --gocode-completer --tern-completer
popd

pushd ~/.vim/bundle/vimproc.vim
make
popd
