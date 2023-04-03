#!/usr/bin/env bash

# change directory to workflows
cd workflows/

# add temp file
touch temp.txt

# add pre-commit-config.txt to temp file
cat ~/Dropbox/Programming/dotfiles/.pre-commit-config.txt >> temp.txt

# remove pre-commit-config.yaml
rm .pre-commit-config.yaml

# rename temp file to pre-commit-config.yaml
mv temp.txt .pre-commit-config.yaml

# change permissions to be executable
chmod +x .pre-commit-config.yaml

# change directory to root
cd ..

# add all files to git
git add .

# commit changes
git commit -m "updated the pre-commit-config.yaml file"
