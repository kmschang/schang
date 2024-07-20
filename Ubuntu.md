
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
gpg --list-secret-keys --keyid-format=LONG
```
- $KEYID = after rsa4096/
```zsh
gpg --export --armor $KEYID > $KEYID.pub.asc ;
gpg --export-secret-keys --armor $KEYID > $KEYID.pri.asc ;
gpg --export-secret-subkeys --armor $KEYID > $KEYID.pri.sub.asc ;
gpg --output $KEYID.rev --gen-revoke $KEYID
```
- You should have to put in your passphrase during this process a few times
```zsh
ll *.asc
```
- Find your keys
```zsh
scp *.asc $KEYID $KEYID.rev ubuntu@10.2.50.34:.gnupg/
```

## On Pi
```zsh
gpg --import *.pri.asc
gpg --list-keys && gpg --list-secret-keys
chmod 700 .
chmod 660 *.asc
``` 
```zsh
gpg --edit-key $KEYID
	expire (1y)
	trust (5 [Ultimate])
	save
```

### GPG Connection with GitHub
```zsh
git config --global --unset gpg.format
git config --global user.signingkey $KEYID
git config --global commit.gpgsign true
```