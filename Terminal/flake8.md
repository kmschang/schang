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
