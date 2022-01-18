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
 tools               : Install neovim, rg, fzf, etc..
 neovim              : Update neovim to nightly version
 fzf                 : Update fzf to nightly version
 k9s                 : Update k9s to nightly version
 gh                  : Update gh to nightly version
 ripgrep             : Update ripgrep to latest release
 terraform           : Update terraform to latest release
 stylua              : Update stylua to latest release
 dotfiles            : Update dotfiles to latest version
 alpine              : Run alpine container for tests
 nginx-conf          : Get ingress configuration for host
 kk-tools            : Run tools containers in current cluster
 colemak             : Install colemak-dhm
 symlinks            : Create symliks to configs
 /tmp/nvim.appimage  : Download nightly nvim appimage
 /tmp/fzf.tgz        : Download latest fzf release
 /tmp/k9s.tgz        : Download latest k9s release
 /tmp/gh.tgz         : Download latest gh release
 /tmp/ripgrep.deb    : Download latest ripgrep release
 /tmp/terraform.zip  : Download latest terraform release
 /tmp/stylua.zip     : Download latest stylua release
```
