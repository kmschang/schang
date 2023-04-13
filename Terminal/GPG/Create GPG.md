### Helpful documentation

https://www.youtube.com/watch?v=1vVIpIvboSg
https://www.youtube.com/watch?v=Y3mLBTCiccs
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
https://huggingface.co/docs/hub/security-gpg
https://www.youtube.com/watch?v=DMGIlj7u7Eo


### Install and set up

install GPG
```bash
$ brew install gnupg
```

change permissions
```bash
$ chmod 0700 .gnupg
```

install necessary agents
```bash
$ brew install pinentry-mac
$ echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
$ killall gpg-agent
```

add GPG config file
```bash
$ cd ~
$ touch gpg-agent.conf
$ cat ~/Dropbox/Programming/dotfiles/templates/gpg.txt >> gpg-agent.conf
```


### Adding keys

adding a GPG key
```bash
$ gpg --full-generate-key
```
- Choose which settings to use by using the keypad


### Connecting with Github

display keys
```bash
$ gpg --list-secret-keys --keyid-format=long
```
- find the key you want to use and copy the ID

show public key
```bash
$ gpg --armor --export <GPG KEY ID>
```

- copy and paste key into github under GPG keys. Make sure to include the part about -----being----- and ------end------

setting key with github
```bash
$ git config --global --unset gpg.format
$ git config --global user.signingkey <GPG KEY ID>
```

turn on autosign
```bash
$ git config --global commit.gpgsign true
```
