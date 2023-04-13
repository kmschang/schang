
## Encrypt a file

Encrypting a file with GPG
```bash
$ gpg -r <RECIPIENT> -e <FILE_NAME>
```
- RECIPIENT is who you want to encrypt it for
	- to encrypt it for yourself set the recipient to the email used on the key
- FILE_NAME is what file you want to encrypt


### Decrypt a file
```bash
$ gpg -d <FILE_NAME>.gpg
```
- FILE_NAME is the file that you want to decrypt
