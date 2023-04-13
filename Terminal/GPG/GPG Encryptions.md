
## Encrypt a file

### Encrypting a file
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
