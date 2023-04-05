
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
