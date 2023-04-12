
congif video
https://www.youtube.com/watch?v=1vVIpIvboSg
https://www.youtube.com/watch?v=Y3mLBTCiccs
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
https://huggingface.co/docs/hub/security-gpg

install GPG
```bash
brew install gnupg
```

edit permissions
```bash
chmod 0700 .gnupg
```

create full key
```bash
gpg --full-generate-key
```

display keys
```bash
gpg --list-secret-keys --keyid-format=long
```
- find the key you want to use and copy the ID found after the 4096R/

show public key
```bash
gpg --armor --export <GPG KEY ID>
```

setting key with github
```bash
git config --global --unset gpg.format
git config --global user.signingkey <GPG KEY ID>
```

turn on autosign
```bash
git config --global commit.gpgsign true
```


install necessary agents
```bash
brew install pinentry-mac
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
```


now all you need to do is add keys to [github.com]()


add gpg config file
```bash
cd ~
touch gpg-agent.conf
cat ~/Dropbox/Programming/dotfiles/templates/gpg.txt >> gpg-agent.config
```


How to delete GPG key (ONLY IF NECESSARY)
```bash
gpg --delete-key <GPG KEY ID>
```
