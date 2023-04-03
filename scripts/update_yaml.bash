#!/usr/bin/env bash

cd workflows/
touch temp.txt
cat ../.pre-commit-config.txt >> temp.txt
rm .pre-commit-config.yaml
mv temp.txt .pre-commit-config.yaml
chmod +x .pre-commit-config.yaml
