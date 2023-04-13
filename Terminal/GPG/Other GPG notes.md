
### Generate revocation certificate
```bash
gpg --output $KEYID.rev --gen-revoke $KEYID
```


## Deleting

### Delete a key
How to delete GPG key with GPG ID
```bash
gpg --delete-key $KEYID
```
How to delete a GPG key with Email
```bash
gpg --delete-key $KEYID
```


### Delete secret keys (delete the whole private key)
```bash
gpg --delete-secret-key $KEYID
```
