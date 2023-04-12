https://pre-commit.com
https://pre-commit.com/hooks.html

### Install necessary packages
```bash
brew install pre-commit
python3 -m pip install -U mypy
```

### [Set up the yaml file](yaml)
```bash
mkdir workflows
cd ./workflows
touch .pre-commit-config.yaml
cat ~/Dropbox/Programming/dotfiles/templates/.pre-commit-config.txt >> .pre-commit-config.yaml
chmod +x .pre-commit-config.yaml
cd ..
```

### Set up the pre-commit hook
```bash
cd .git/hooks
mv pre-commit.sample pre-commit
truncate -s 0 pre-commit
cat ~/Dropbox/Programming/dotfiles/templates/pre-commit.txt >> pre-commit
chmod +x pre-commit
xattr -d com.apple.quarantine pre-commit
cd ../..
```

### Remove hooks
```bash
cd .git/hooks
mv pre-commit pre-commit.sample
cd ../..
rmdir -r workflows
```
