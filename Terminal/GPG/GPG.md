#pi #gpg
## Install and set up

### install GPG
```bash
brew install gnupg
```

### change permissions
```bash
chmod 0700 .gnupg
```

### install necessary agents
```bash
brew install pinentry-mac
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
```

### add GPG config files
```bash
cd ~/.gnugp
touch gpg-agent.conf
cat ~/Dropbox/Programming/dotfiles/templates/gpg-agent.txt >> gpg-agent.conf
touch gpg.conf
cat ~/Dropbox/Programming/dotfiles/templates/gpg.txt >> gpg.conf
```


## Creating the Key

### Create the key in expert mode
```bash
gpg --expert --full-generate-key
```
 - 8 = RSA own capability; choose certify only; 4096 bits
 - UID = name, emails and a comment

### Find $KEYID
```bash
gpg --list-secret-keys --keyid-format=long
```
- Find the key you want to use, copy the KEYID after the type of necryption

### Add subkeys
```bash
gpg --expert --edit-key $KEYID
```
- showpref
- addkey (8 = RSA own capability); encrypt; 4096 bits; no expire
- addkey (8 = RSA own capability); sign; 4096 bits; no expire
- addkey (8 = RSA own capability); authenticate; 4096 bits; no expire
- save
- quit

### Generate revocation certificate
```bash
gpg --output $KEYID.rev --gen-revoke $KEYID
```

### Export Keys
```bash
gpg --export --armor $KEYID > $KEYID.pub.asc ;
gpg --export-secret-keys --armor $KEYID > $KEYID.pri.asc ;
gpg --export-secret-subkeys --armor $KEYID > $KEYID.pri.sub.asc ;
gpg --output $KEYID.rev --gen-revoke $KEYID
```


## Setting up with GitHub

### Display keys
```bash
gpg --list-secret-keys --keyid-format=long
```
- find the key you want to use and copy the ID

### Show public key
```bash
gpg --armor --export $KEYID
```
- copy and paste key into github under GPG keys. Make sure to include the part about -----being----- and ------end------

### Setting key with github
```bash
git config --global --unset gpg.format
git config --global user.signingkey $KEYID
```

### Turn on autosign
```bash
git config --global commit.gpgsign true
```


## Encrypt a file

### Encrypting a file regularly
```bash
gpg -r <recipient> -e <filename>
```
- `recipient`  is who you want to encrypt it for
	- to encrypt it for yourself set the recipient to the email used on the key
- `filename` is what file you want to encrypt

### Encrypting a file with password
```bash
gpg --symmetric <filename>
```
- `filename` is what file you want to encrypt
-
### Decrypt a file
```bash
gpg -d <filename.gpg>
```
- `filename` is the file that you want to decrypt



## Other Setting

### Sign keys with primary key
```bash
gpg --sign-key $KEYID

gpg --fingerprint $KEYID
gpg --sign-key -u <signing-keyid> --ask-cert-level $KEYID
gpg --check-sigs
```

### Change expiration
```bash
gpg --expert --edit-key $KEYID
```
- expire (change primary key)
- expire
- key * (select all subkeys)
- expire
- save

### Add UIDs
```bash
gpg --expert --edit-key $KEYID
```
- adduid
- trust
- primary
- save

### Revoke/Delete UIDs
```bash
gpg --expert --edit-key $KEYID
```
- uid x (where 'x' is the uid to revoke)
- revuid
- 4 (indicate not needed anymore; then enter a comment)
- save
-    -or-
- uid x (where 'x' is the uid to revoke)
- deluid
- save

### Delete secret keys (delete the whole private key)
```bash
gpg --delete-secret-key $KEYID
```

### Encrypting and decrypting
```bash
gpg --encrypt <filename> # makes .gpg file that contains the encrypted original file
gpg --symmetric <filename> # encrypts using password
gpg --decrypt <filename.gpg> # decrypts .gpg file
```

### Listing keys
```bash
gpg --list-keys # lists public keys
gpg --list-secret-keys # lists private keys
gpg --list-sigs # lists keys and signatures
```
#### markers
- sec = secret key
- sub = subkey (secondary key)
- ssb = secret subkey
-  # = key is not usable; taken offline (e.g. private key not available; used —export-secret-subkeys)
-  > = key is stored on smartcard (e.g. stub only; not stored on computer; need Yubikey)

### Deleting keys
```bash
gpg --delete-keys <keyid> # delete key
gpg --delete-secret-keys <keyid> # delete private key
```



## Helpful documentation

https://www.youtube.com/watch?v=1vVIpIvboSg
https://www.youtube.com/watch?v=Y3mLBTCiccs
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
https://huggingface.co/docs/hub/security-gpg
https://www.youtube.com/watch?v=DMGIlj7u7Eo
