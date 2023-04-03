#!/usr/bin/env bash

# Install necessary packages
brew install pre-commit
python3 -m pip install -U mypy

# Set up yaml file
mkdir workflows
cd ./workflows
touch .pre-commit-config.yaml
cat ../../dotfiles/.pre-commit-config.txt >> .pre-commit-config.yaml
chmod +x .pre-commit-config.yaml
cd ..


# Set up pre-commit hook
cd .git/hooks
mv pre-commit.sample pre-commit
truncate -s 0 pre-commit
cat ../../../dotfiles/pre-commit.txt >> pre-commit
xattr -d com.apple.quarantine pre-commit