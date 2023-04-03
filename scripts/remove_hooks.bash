#!/usr/bin/env bash

## Remove pre-commit hook
cd .git/hooks
mv pre-commit pre-commit.sample
cd ../..
rm workflows/.pre-commit-config.yaml
