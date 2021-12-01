# My configuration files

[![GitGuardian scan](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml)
[![Linters](https://github.com/sbulav/dotfiles/actions/workflows/commit_validate.yml/badge.svg?branch=master)](https://github.com/sbulav/dotfiles/actions/workflows/commit_validate.yml)

## Tools installation

Run make and specify tool to install:

```bash
make
 tools               : Install neovim, rg, fzf, etc..
 neovim              : Update neovim to nightly version
 fzf                 : Update fzf to nightly version
 k9s                 : Update k9s to nightly version
 gh                  : Update gh to nightly version
 ripgrep             : Update ripgrep to latest release
 terraform           : Update terraform to latest release
 dotfiles            : Update dotfiles to latest version
 alpine              : Run alpine container for tests
 nginx-conf          : Get ingress configuration for host
 kk-tools            : Run tools containers in current cluster
 symlinks            : Create symliks to configs
```

Run `make tools` to install all of the tools.

Create symlinks:
```
ln -s ~/dotfiles/nvim/ ~/.config/nvim
ln -s ~/dotfiles/Makefile  ~/Makefile
ln -s ~/dotfiles/tmux/plugins/kube-tmux ~/.tmux
ln -s ~/dotfiles/fish/ ~/.config/fish
```

## NeoVim configuration

Just run `nvim` or `vim` if you've aliased `vim`=`nvim`

`vim-plug` will be installed automatically.

- To install missing neovim Plugins, run `PlugInstall`
- To update plugins, run `PlugUpdate`.
  - You can use `D` to view changes

