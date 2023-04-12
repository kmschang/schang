
configuration
https://clang.llvm.org/docs/ClangFormat.html
https://bcain-llvm.readthedocs.io/projects/clang/en/latest/ClangFormatStyleOptions/


install
```bash
brew install clang-format
```

add config file in root directory
```bash
touch .clang-format
```

add to config file
```bash
cat ~/Dropbox/Programming/dotfiles/templates/clang-format.txt >> .clang-format
```

I no longer have it in the pre-commit hook but instead can be run standalone
```bash
bash ~/Dropbox/Programming/dotfiles/scripts/clang.bash
```

how to execute
```bash
clang-format -i <FILE_NAME>
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
