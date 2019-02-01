#!/usr/bin/env bash

files="
    curlrc
    gitattributes
    gitconfig
    gitignore
    vimrc
    wgetrc
"

for file in $files
do
    cp $file ~/.$file
done

cp -T -r vim ~/.vim
