#!/usr/bin/env bash

# Read file in
read varfilename

# Change directory to src
cd ~/Dropbox/Programming/Java/src

# Change file permissions to be executable
chmod +x $varfilename

# Add temp file
touch temp.txt

# Run clang-format on file and save to temp file
clang-format -style=file $varfilename > temp.txt

# Clear original file
truncate -s 0 $varfilename

# Add temp file to original file
cat temp.txt >> $varfilename

# Remove temp file
rm temp.txt

# Change file permissions to be non-executable
chmod -x $varfilename
