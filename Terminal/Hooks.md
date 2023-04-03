https://pre-commit.com
https://pre-commit.com/hooks.html

- **Don't use indents, change them to spaces**

```bash
mkdir workflows
cd ./workflows
brew install pre-commit
touch .pre-commit-config.yaml
```
- **Copy and past Total file into .pre-commit-config.yaml**

### Pyupgrade

```bash
python3 -m pip install -U mypy
```

add to bottom
```
-   repo: https://github.com/asottile/pyupgrade
    rev: v3.3.1
    hooks:
    -   id: pyupgrade
```

### flake8

add to bottom
```
- repo: https://github.com/PyCQA/flake8
  rev: 6.0.0
  hooks:
  -   id: flake8
```



## Total file
```
# See https://pre-commit.com for more information
# See https://pre-commit.com/hooks.html for more hooks
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.2.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files
    -   id: name-tests-test
    -   id: mixed-line-ending
    -   id: check-ast

-   repo: https://github.com/asottile/pyupgrade
    rev: v3.3.1
    hooks:
    -   id: pyupgrade

-   repo: https://github.com/PyCQA/flake8
    rev: 6.0.0
    hooks:
    -   id: flake8
```