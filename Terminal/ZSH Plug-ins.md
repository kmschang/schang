

## Plug-ins
https://github.com/unixorn/awesome-zsh-plugins#plugins

### Color Commands
https://github.com/zdharma-continuum/fast-syntax-highlighting#installation
```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/path/to/fsh
vi .zshrc
```

Paste this under the plugins section at the bottom
```bash
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh
```

### bd
https://github.com/Tarrasch/zsh-bd
```bash
mkdir -p $HOME/.zsh/plugins/bd
curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > $HOME/.zsh/plugins/bd/bd.zsh
print -- "\n# zsh-bd\n. \$HOME/.zsh/plugins/bd/bd.zsh" >> $HOME/.zshrc
```
