
congif video
https://www.youtube.com/watch?v=1vVIpIvboSg
https://www.youtube.com/watch?v=Y3mLBTCiccs
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key

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





add gpg config file
```bash
cd ~
touch gpg-agent.conf
cat ~/Dropbox/Programming/dotfiles/templates/gpg.txt >> gpg-agent.config
```
