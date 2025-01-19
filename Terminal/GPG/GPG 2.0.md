#pi #gpg
# GPG/PGP

[YubiKey Guide][1]
[Best Practices][2]

## Create keys
### Generate master key in expert mode
```bash
gpg --expert --full-generate-key
```
- 8 = RSA own capability; choose certify only; 4096 bits
- UID = name, emails and a comment

### Sign with previous key if possible
```bash
gpg --sign-key $KEYID

gpg --fingerprint $KEYID
gpg --sign-key -u <signing-keyid> --ask-cert-level $KEYID
gpg --check-sigs
```
- cannot sign key unless signing key has “certify” authority and is in keychain
- `--lsign-key` = local sign; non-exportable; same as `--edit-key; lsign`
- `--ask-cert-expire` = certificate expiration

### Add subkeys
```bash
gpg --expert --edit-key $KEYID
```
- showpref
- addkey (8 = RSA own capability); encrypt; 4096 bits; no expire 0x98728F34BBCFA64F
- addkey (8 = RSA own capability); sign; 4096 bits; no expire 0x275CB6B56B21BEB7
- addkey (8 = RSA own capability); authenticate; 4096 bits; no expire 0xE8C7D99817196466
- save
- quit

### Add UIDs
```bash
gpg --expert --edit-key $KEYID
```
- adduid
- trust
- primary
- save
```bash
gpg --list-secret-keys
```

### Generate revocation certificate
```bash
gpg --output $KEYID.rev --gen-revoke $KEYID
```

## Manage keys
### Inspect keys
```bash
gpg <filename>.asc
gpg --with-colons <filename>.asc
gpg -vv <filename>.asc
gpg --import-options show-only --import <filename>.asc
```

### Change expiration
```bash
gpg --expert --edit-key $KEYID
```
- expire (change primary key)
- expire
- key \* (select all subkeys)
- expire
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
```bash
gpg --list-secret-keys
```

### Delete secret keys (delete the whole private key)
```bash
gpg --delete-secret-key $KEYID
```

### Determine key preferences
```bash
gpg -a --export 0xD4969B4F066BB923 | gpg --list-packets
gpg -a --export 0xD4969B4F066BB923 | gpg --list-packets | fgrep ‘pref-‘
gpg --edit-key $KEYID
```
- showpref
- setpref

## Signing and verifying
```bash
gpg --sign <filename> # makes .gpg file that contains message and signature in binary
gpg --verify <filename.gpg> # verify signature of .gpg file

gpg --detach-sign <filename> # makes .sig file that contains only a binary signature
gpg --verify <filename.sig> # verify signature of .sig file

gpg --clearsign <filename> # makes .asc file that wraps file and signature in ascii text
gpg --verify <filename.asc> # verify signature of .asc file
```
## Encrypting and decrypting
```bash
gpg --encrypt <filename> # makes .gpg file that contains the encrypted original file
gpg --symmetric <filename> # encrypts using password
gpg --decrypt <filename.gpg> # decrypts .gpg file
```
## Listing keys
```bash
gpg --list-keys # lists public keys
gpg --list-secret-keys # lists private keys
gpg --list-sigs # lists keys and signatures
```
### markers
- sec = secret key
- sub = subkey (secondary key)
- ssb = secret subkey
-  \# = key is not usable; taken offline (e.g. private key not available; used —export-secret-subkeys)
-  \> = key is stored on smartcard (e.g. stub only; not stored on computer; need Yubikey)

## Deleting keys
```bash
gpg --delete-keys <keyid> # delete key
gpg --delete-secret-keys <keyid> # delete private key
```

## Editing keys
```bash
gpg --edit-key <keyid>
```
- frp (verify fingerprint)
- sign keyid (sign key with another key)
- trust (define trust)

## Other commands
```bash
gpg --update-trustdb # update web of trust
gpg --print-mds <filename> # print message digests using all available algorithms
```

[1]:	https://github.com/drduh/YubiKey-Guide/tree/fc6f9eb80d5eee4057f194b5859ae438e4e9a2d9
[2]:	https://riseup.net/en/security/message-security/openpgp/gpg-best-practices
[3]:	hkps://hkps.pool.sks-keyservers.net
