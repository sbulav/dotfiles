# My configuration files

[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)](https://github.com/neovim/neovim)

[![GitGuardian scan](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml)
[![release-please](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml)

Managed via Nix in [dotnix](https://github.com/sbulav/dotnix)

## Automated workflows

I'm using following workflows to automate management of my dotfiles:
- [automerge-release.yml](.github/workflows/automerge-release.yml) - Merge
  changelog automated PR
- [commit_validate.yml](.github/workflows/commit_validate.yml) - Validate
  commits are using `conventional commits` style
- [gitguardian.yml](.github/workflows/gitguardian.yml) - Check for leaking
  secrets/tokens
- [please_release.yml](.github/workflows/please_release.yml) - Automated
  releases based on conventional commits
- [update-readme.yml](.github/workflows/update-readme.yml) - Workflow to
  generate this README
