# Hooks

## Formatter

### Black

install
```bash
pip install black
```

black script
```bash
#!/usr/bin/env bash

# This script is used to format the code using black.

# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the root directory of the project.
cd "$(dirname "$0")/.."

# Format the code.
black .
```

add permissions to script
```bash
chmod +x <FILE_NAME>
```



### clang-format

configuration
https://clang.llvm.org/docs/ClangFormat.html

install
```bash
brew install clang-format
```

I no longer have it in the pre-commit hook but instead can be run standalone
```bash
bash ~/Dropbox/Programming/dotfiles/scripts/clang.bash
```

how to execute
```bash
clang-format -i <FILE_NAME>
```

script code
```bash
read varfilename
cd ~/Dropbox/Programming/Java/src
chmod +x $varfilename
touch temp.txt
clang-format -style=file $varfilename > temp.txt
truncate -s 0 $varfilename
cat temp.txt >> $varfilename
rm temp.txt
chmod -x $varfilename
```

secondary script code
```bash
#!/usr/bin/env bash

# This script is used to format the code using clang-format.

# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the root directory of the project.
cd "$(dirname "$0")/.."

# Format the code.
clang-format -i ~/Dropbox/Programming/Java/src/*.java
```

add permissions to script
```bash
chmod +x <FILE_NAME>
```



### Unneeded f string (Python Only)

github
https://github.com/dannysepler/rm_unneeded_f_str

install
```bash
pip install rm_unneeded_f_str
```










## Linter

### Codespeller

github
https://github.com/codespell-project/codespell

configuration
https://calmcode.io/pre-commit/spelling.html


install
```bash
pip install codespell
```

use
```bash
codespell <FILE_NAME>
```

find error and change
```bash
codespell -w <FILE_NAME>
```

normal commang
```bash
codespell --skip '*.git' -w *.py *.md *.txt *.java
```

script
```bash
#!/usr/bin/env bash

# This script is used to check the code for spelling errors using codespell.

# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the root directory of the project.
cd "$(dirname "$0")/.."

# Check the code for spelling errors.
codespell --skip '*.git' -w src/*.py src/*.md src/*.txt src/*.java
```

add permissions
```bash
chmod +x codespell.bash
```



### flake8

install instructions
https://flake8.pycqa.org/en/latest/user/configuration.html

Rules
https://www.flake8rules.com

install
```bash
brew install flake8
```

add configuration file
```bash
touch .flake8
```

add to configuration file
```bash
cat ~/Dropbox/Programming/dotfiles/templates/flake8.txt >> .flake8
```

flake8 script
```bash
#!/usr/bin/env bash

# This script is used to format the code using flake8.

# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the root directory of the project.
cd "$(dirname "$0")/.."

# Format the code.
flake8 .
```

add permissions to script
```bash
chmod +x <FILE_NAME>
```


### Ruff

install instructions
https://beta.ruff.rs/docs/tutorial/

Configure page
https://beta.ruff.rs/docs/configuration/


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

ruff script
```bash
#!/usr/bin/env bash

# This script is used to format the code using ruff.

# Exit immediately if a command exits with a non-zero status.
set -e

# Change to the root directory of the project.
cd "$(dirname "$0")/.."

# Format the code.
ruff .
```

add permissions to script
```bash
chmod +x <FILE_NAME>
```





## Hooks

https://pre-commit.com
https://pre-commit.com/hooks.html

### Install necessary packages
```bash
brew install pre-commit
python3 -m pip install -U mypy
```

### Set up the yaml file
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


## yaml

### update yaml versions
```bash
cd workflows/
pre-commit autoupdate --bleeding-edge
```


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
        args: [-i]
```

### Black
```
-   repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
    -   id: black
```

### flake8 (Not using)
```
-   repo: https://github.com/PyCQA/flake8
    rev: 6.0.0
    hooks:
    -   id: flake8
```

### ruff
```
-   repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: 'v0.0.260'
    hooks:
    -   id: ruff
```

### codespell
```
-   repo: https://github.com/codespell-project/codespell
    rev: v1.16.0
    hooks:
    -   id: codespell
        name: codespell
        description: Checks for common misspellings in text files.
        entry: codespell --skip '*.git' -w *.py *.md *.txt *.java
        language: python
        types: [text]
```

### unneeded f strings
```
-   repo: https://github.com/dannysepler/rm_unneeded_f_str
    rev: v0.2.0
    hooks:
    -   id: rm-unneeded-f-str
```
