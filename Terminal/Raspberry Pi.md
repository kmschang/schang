
## Download Ubuntu Server
https://ubuntu.com/download/raspberry-pi

## SSH
```bash
ssh ubuntu@<ip_address>
```
- `ip_address` Find out what the ip address is and use that to ssh into it


## Adding user
https://www.cyberciti.biz/faq/add-new-user-account-with-admin-access-on-linux/
```bash
sudo useradd $username               # Adds said user to pi
sudo usermod -aG sudo $username      # Changes permissions for said user
id $username                         # Verifies the existence of said user
su - $username                       # Switches to said user
```


## Adding git
https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04
```bash
sudo apt install git
git --version
```


## Adding ZSH
https://www.tecmint.com/install-oh-my-zsh-in-ubuntu/
```bash
sudo apt install curl wget git zsh   # Adding necessary software
```
- 'Y' change zsh to main shell

## Configuring ZSH
https://linuxhint.com/install-use-oh-my-zsh/
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
vim .zshrc
```
- change theme 
	- ZSH_THEME="powerlevel10k/powerlevel10k”
- Add aliases
	- alias ll="lsd -alF"
```bash
source .zshrc                        # Command for changes to take place
```
