
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

# SSH and GPG from Mac to Pi

## SSH

### On Mac
```zsh
cd ~/.ssh
scp id_ed25519* ubuntu@10.2.50.34:.ssh
```

### On Pi
```zsh
cd ~/.ssh 
echo 'IdentityFile ~/.ssh/id_ed25519' > config 
cat *.pub > authorized_keys 
chmod 700 . 
chmod 600 *
```


## GPG

### On Mac
```zsh
cd ~/.gnupg
scp dirmngr.conf gpg-agent.conf gpg.conf hkps.pool.sks-keyservers.net.pem ubuntu@10.2.50.34:.gnupg
```


## On Pi
```zsh
``` 

