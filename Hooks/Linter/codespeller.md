#linter #git #hook

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
codespell <filename>
```

find error and change
```bash
codespell -w <filename>
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
