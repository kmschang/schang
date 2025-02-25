#ubuntu #pi
# Download Ubuntu Server

[https://ubuntu.com/download/raspberry-pi](https://ubuntu.com/download/raspberry-pi)

## Using Raspberry Pi

- Choose device
- Choose system; use custom; select file
- Choose storage (SD Card)
- Next
- Edit settings
	- Set hostname
		- k2.pi
	- Set username
		- Ubuntu
	- Set Password
		- Save to 1password
	- Enable SSH
		- Use public key authentication
- Save
- Apple OS customization settings
- Card will be ready for input now

## Mac Updates
```zsh
cd ~/.ssh
vi known_hosts
```
- Delete all lines that aren't github or at leas the ones that have the pi's ip adress there

## SSH and GPG from Mac to Pi

### SSH

#### On Mac
```zsh
cd ~/.ssh
scp id_ed25519* ubuntu@10.2.50.34:.ssh
```

#### On Pi
```zsh
cd ~/.ssh 
echo 'IdentityFile ~/.ssh/id_ed25519' > config 
cat *.pub > authorized_keys 
chmod 700 . 
chmod 600 *
```

### Add Dad's Public Key
```zsh
cd ~/.ssh
cat "$DADKEYID" >> authorized_keys
```
- Adds Dad's public key, allowing him to SSH onto my pi 

### Run SSH agent

```zsh
eval $(ssh-agent -s -t 12h)
ssh-add /home/ubuntu/.ssh/id_ed25519
ssh-add -L
```

### GPG

#### On Mac
```zsh
cd ~/.gnupg
gpg --list-secret-keys --keyid-format=LONG
scp dirmngr.conf gpg-agent.conf gpg.conf hkps.pool.sks-keyservers.net.pem ubuntu@10.2.50.34:.gnupg
```
- $KEYID = after rsa4096/

```zsh
gpg --export --armor $KEYID > $KEYID.pub.asc
gpg --export-secret-keys --armor $KEYID > $KEYID.pri.asc
gpg --export-secret-subkeys --armor $KEYID > $KEYID.pri.sub.asc
gpg --output $KEYID.rev --gen-revoke $KEYID
```
- You should have to put in your passphrase during this process a few times

```zsh
ll *.asc
```
- Find your keys

```zsh
scp $KEYID.* ubuntu@10.2.50.34:.gnupg/
```

#### On Pi
```zsh
cd ~/.gnupg
gpg --import *.pri.asc
gpg --list-keys && gpg --list-secret-keys
chmod 700 .
chmod 660 *.asc
``` 

#### Check pinentry
```zsh
cd ~/.gnupg
vi gpg-agent.conf
```
- Delete line that has pinentry associated with brew, if so ...
```zsh
sudo reboot
```


```zsh
gpg --edit-key $KEYID
	expire 
		(1y)
	trust 
		(5 [Ultimate])
	save
```
- inside gpg, each line is a command 

#### GPG Connection with GitHub
```zsh
git config --global user.email = "kyle@schang.net"
git config --global user.name = "Kyle Schang"

git config --global --unset gpg.format
git config --global user.signingkey $KEYID
git config --global commit.gpgsign true
```

```zsh
sudo gpgconf --kill gpg-agent
gpg-agent
```


## Install dotfiles into home directory and install zsh
```zsh
cd ~
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:kmschang/dotfiles.git $HOME/.dotfiles
dot checkout main

dot config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'

dot --bare fetch 

dot config --local status.showUntrackedFiles no 
dot submodule update --init # ccreate new brnach for local changes 

dot checkout -b pi-$PIID
dot push --set-upstream origin pi-$PIID
```

###  Confirm config
```zsh
vi ~/.dotfiles/config
```

```zsh
[remote "origin"]
	url = git@github.com:kmschang/dotfiles.git
	fetch = +refs/head/*:refs/remotes/origin/*
[branch "main"]
	remote = origin
	merge = refs/heads/main
```


### Create a git repository (SKIP)
```zsh
cd /etc 
sudo git init -b main 
sudo git config --global core.editor '/usr/bin/vim' 
sudo git config --global user.email 'kyle@schang.net' 
sudo git config --global user.name 'Kyle Schang' 
sudo git config --global init.defaultBranch main 
sudo git add .pwd.lock * && sudo git status 
sudo git commit -m Initial
```

### Install pynev (optional)
```zsh
cd 
git clone https://github.com/pyenv/pyenv.git ~/.pyenv 
git clone https://github.com/pyenv/pyenv-virtualenv.git $(~/.pyenv/bin/pyenv root)/plugins/pyenv-virtualenv
```

### Update fzf
```
~/.zsh/fzf/install
```

### Additional setup and configuration
```zsh
cd 
sudo apt update 
sudo apt install bat entr eza fd-find git-delta lsd mosh multitail rclone ripgrep tmux tree zsh zsh-common zsh-doc
```

```zsh
cd ~/bin
ln -s /usr/bin/batcat bat
ln -s /usr/bin/exa eza
ln -s /usr/bin/fdfind fd
#ln -s $(which fdfind) ~/.local/bin/fd
ln -s /home/ubuntu/.zsh/fzf/bin/fzf fzf
```

**(SKIP)**
```zsh
mkdir -p $XDG_STATE_HOME/vim
```

### Change shell

```zsh
chsh --shell /usr/bin/zsh
sudo reboot
```




## Tailscale

### Install tailscale
```zsh
curl -fsSL https://tailscale.com/install.sh | sh
```

### Update
```zsh
sudo apt-get update
sudo apt install --only-upgrade tailscale
```

```zsh
sudo tailscale version
```

### Check execution status

```zsh
sudo systemctl status tailscaled
```

## Connect

```zsh
sudo tailscale up
```
- Navigate to link given by tailscale
- Sign-in with Apple
- Add k2pi to tailscale

### Enable exit node

```zsh
sudo tailscale up --advertise-exit-node
```

### Using an exit node

```zsh
sudo tailscale up --exit-node=<exit-node-ip>
-or-
sudo tailscale up --exit-node=<exit-node-ip> --exit-node-allow-lan-access=true
```

### Get status

```zsh
sudo tailscale status
```
