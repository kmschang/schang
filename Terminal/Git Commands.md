#linux #git

## Changing author of account
```bash
git config --global user.name "USERNAME"     #"Kyle Schang"
git config --global user.email EMAIL         #Kyle@schang.net
```

## Adding to Github
```bash
git add .
git commit -m '{MESSAGE}'
git push
```

## .gitignore
```bash
echo .DS_Store >> .gitignore
git add .gitignore
git rm -r --cached .DS_Store
git commit -m '.DS_Store banished!'
```

## Add existing code to repository
```bash
echo "# README" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin <GITHUB SSH URL>
git push -u origin main
```

## Add existing code to repository (Changes in GitHub already)
``` bash
git init
git branch -M main
git remote add origin <GITHUB SSH URL>
git pull --force origin main
git push -u origin main
```

## Create git branch (add remote)
``` bash
git checkout -B <BRANCHNAME>
git push origin -u <BRANCHNAME>
```

## Reset to last commit
```zsh
git reset --hard HEAD
```

#### Cloning a repository
```bash
git clone <GITHUB SSH URL>
```


##### Delete repository
```bash
rm -fr .git
```


### Git Hooks

removes apple attributes to hook files
```bash
xattr -d com.apple.quarantine <FILE_NAME>
```
