#!/bin/sh

git config --global user.name "pinzolo"
git config --global user.email "pinzolo@gmail.com"
git config --global core.quotepath false
git config --global core.excludesfile ~/.gitignore
git config --global core.editor vim
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.cm commit
git config --global alias.br branch
git config --global alias.st status
git config --global alias.mr 'merge --no-ff'
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'

