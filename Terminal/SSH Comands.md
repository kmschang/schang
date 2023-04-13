#linux #git

https://goteleport.com/blog/how-to-set-up-ssh-keys/

##### Making a new SSH Key
``` bash
ssh-keygen -t ed25519 -C "SSH KEY"
```


##### Add SSH Key to Keychain (DON'T USE)
```bash
ssh-add --apple-use-keychain ~/.ssh/[your-private-key]
```
