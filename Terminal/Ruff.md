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
