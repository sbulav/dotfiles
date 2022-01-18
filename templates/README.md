# My configuration files

[![GitGuardian scan](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml)
[![release-please](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml)

This file is auto-generated, do not modify it!

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


## Tools installation

Run make and specify tool to install:

```bash
> make
