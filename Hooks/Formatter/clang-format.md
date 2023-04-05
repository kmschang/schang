
install
```bash
brew install clang-format
```

I no longer have it in the pre-commit hook but instead can be run standalone
```bash
bash ~/Dropbox/Programming/dotfiles/scripts/clang.bash
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

add permissions to script
```bash
chmod +x <FILE_NAME>
```
