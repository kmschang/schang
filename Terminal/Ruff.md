
Install
```bash
pip install ruff
```

add configuration file
```bash
touch pyproject.toml
```

add to configuration file
```bash
cat ~/Dropbox/Programming/dotfiles/templates/ruff.txt >> pyproject.toml
```

run ruff
```bash
ruff <FILE_NAME>
```

fix some errors
```bash
ruff <FILE_NAME> --fix
```
