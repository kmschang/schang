#!/usr/bin/env bash

cd workflows/
touch temp.txt
cat ~/Dropbox/Programming/dotfiles/.pre-commit-config.txt >> temp.txt
rm .pre-commit-config.yaml
mv temp.txt .pre-commit-config.yaml
chmod +x .pre-commit-config.yaml
