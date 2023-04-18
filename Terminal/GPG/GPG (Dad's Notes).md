# GPG/PGP

[YubiKey Guide][1]
[Best Practices][2]

## Create keys
### Generate master key in expert mode
```bash
gpg --expert --full-generate-key
export KEYID=D4969B4F066BB923
```
- 8 = RSA own capability; choose certify only; 4096 bits
- UID = name, emails and a comment
- keyid = D4969B4F066BB923 (my Yubico Nano key)

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

### Export keys
```bash
gpg --export --armor <keyid> > <keyid>.pub.asc (BrianSchang_066BB923.pub.asc)
gpg --export --armor 066BB923 > D4969B4F066BB923.pub.asc

# -> put ! after the --armor keyid! to force export of that key only
gpg --export --armor 066BB923! > D4969B4F066BB923.pub2.asc (e.g. subkeys will not be exported)

gpg --export-secret-keys --armor <keyid> > <keyid>.pri.asc (BrianSchang_066BB923.pri.asc)
gpg --export-secret-keys --armor 066BB923 > D4969B4F066BB923.pri.asc

gpg --export-secret-subkeys --armor <keyid> > <keyid>.pri_sub.asc (BrianSchang_066BB923.pri_sub.asc)
gpg --export-secret-subkeys --armor 066BB923 > D4969B4F066BB923.pri_sub.asc
# primary secret key is made useless
# this is the one we want to import and the move subkeys to Yubikey
export KEYID=BD4078F36FAAF9B9
gpg --export --armor $KEYID > $KEYID.pub.asc ;
gpg --export-secret-keys --armor $KEYID > $KEYID.pri.asc ;
gpg --export-secret-subkeys --armor $KEYID > $KEYID.pri.sub.asc ;
gpg --output $KEYID.rev --gen-revoke $KEYID
```

### Delete secret keys (delete the whole private key)
```bash
gpg --delete-secret-key $KEYID
```

### Import secret key and all secret subkeys
```bash
gpg --import <keyid>.pri.asc
gpg --import BrianSchang_066BB923.pri.asc
```
- only do this when the primary key is needed for signing
- primary secret key has “certify” authority and thus can sign other keys
- should delete this key and replacd with only subkeys after signing (see below)

### Import only secret subkeys (import only the private subkeys)
````bash
gpg --import <keyid>.pri_sub.asc
gpg --import BrianSchang_066BB923.pri_sub.asc
```
````
- remember to move subkeys to the card (leaving only the stub in the database itself)
- primary secret key will not be imported (since importing file created with —export-secret-subkeys)
- primary secret key will not be imported thus will be unable to sign other keys

### Determine key preferences
```bash
gpg -a --export 0xD4969B4F066BB923 | gpg --list-packets
gpg -a --export 0xD4969B4F066BB923 | gpg --list-packets | fgrep ‘pref-‘
gpg --edit-key $KEYID
```
- showpref
- setpref

### Ensure keys are robust
```bash

gpg --export-options export-minimal --export D4969B4F066BB923 | gpg --list-packets | grep version
```
- All keys should be version 4
```bash
gpg --export-options export-minimal --export D4969B4F066BB923 | gpg --list-packets | egrep -A2 "^:public (sub )?key packet:$" | grep algo
```
- algo 1 = RSA
- algo 17 = DSA (not good)
- algo 18 = ECC
- algo 19 = ECDSA
```bash
gpg --export-options export-minimal --export D4969B4F066BB923 | gpg --list-packets | grep -A2 "public key" | grep "pkey\[0\]:"
```
- should be at least 3072 bits; 4096 is better

### Key server

[hkps://hkps.pool.sks-keyservers.net][3]
```bash
gpg --keyserver hkp://keys.openpgp.org --search-key 'brian@schang.net'
gpg --keyserver hkp://pool.sks-keyservers.net --search-key 'brian@schang.net'
gpg --key server hkp://key server.ubuntu.com --search-key 'brian@schang.net'

gpg --refresh-keys
gpg --search-keys
```
### dirmngr

Put config in dirmngr.conf
```bash
gpgconf --kill dirmngr
gpgconf --launch dirmngr
```

### Yubico
```bash
gpg --edit-card
```
- admin
- passwd (change or unblock PIN, admin PIN or reset code)
- name (Brian Schang)
- lang (en)
- salutation (Mr.)
- key-attr
- login (account name)
- list
- quit
```bash
gpg --card-status
gpg --edit-key <keyid>
```
- key 1 (encryption)
- keytocard
	- 2

- key 1 (toggle off key 1)
- key 2 (signature)
- keytocard
	- 1

- key 2 (toggle off key 2)
- key 3 (authentication)
- keytocard
	- 3

- save

```bash
gpg --list-secret-keys
```

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
