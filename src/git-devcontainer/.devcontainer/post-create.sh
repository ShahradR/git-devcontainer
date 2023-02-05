#! /bin/bash

pre-commit install --install-hooks
pre-commit install --install-hooks --hook-type commit-msg

pip install codespell mkdocs mkdocs-material

npm install -g commitizen cz-conventional-changelog markdown-link-check markdownlint-cli2
