
### pre-commit hooks
```
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
    -   id: check-case-conflict
```

### pyupgrade
```
-   repo: https://github.com/asottile/pyupgrade
    rev: v3.3.1
    hooks:
    -   id: pyupgrade
```

### clang-format
**You have to add** fail_fast: false **one the top line before the first repo:**
```
-   repo: https://github.com/pocc/pre-commit-hooks
    rev: master
    hooks:
    -   id: clang-format
        args: [--style=Google]
```

### Black
```
-   repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
    -   id: black
```

### flake8
```
-   repo: https://github.com/PyCQA/flake8
    rev: 6.0.0
    hooks:
    -   id: flake8
```