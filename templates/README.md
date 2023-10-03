# My configuration files

[![Always wip](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrgUjNod0ETGyHau0Tkn-WAnFjXLP493ryUQ&usqp=CAU)]
[![GitGuardian scan](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/gitguardian.yml)
[![release-please](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml/badge.svg)](https://github.com/sbulav/dotfiles/actions/workflows/please_release.yml)

This file is auto-generated, do not modify it!

## Nix

I am currently in the process of migration to [Nix](https://nixos.org/)

- MacOS
  - [Nix Flakes](https://nixos.wiki/wiki/Flakes)
  - [Nix-Darwin](https://github.com/LnL7/nix-darwin)
  - [Home-Manager](https://nix-community.github.io/home-manager/)
- NixOS
  - [Nix Flakes](https://nixos.wiki/wiki/Flakes)
  - [Home-Manager](https://nix-community.github.io/home-manager/)
  - [Hyprland](https://wiki.hyprland.org) + Waybar, Swaylock, Rofi, mako, hyprpaper

To trigger a new build both on Mac and Nix, run

```sh
./bin/build
```

Kudos for config inspiration to:

- [Introduction to Nix & NixOS](https://nixos-and-flakes.thiscute.world/introduction/)
- [Nix for MacOS by dustinlyons](https://github.com/dustinlyons/nixos-config)
- [Nix starter configs by Misterio77](https://github.com/Misterio76/nix-starter-configs)

You might also want to check out my blog with [#Nix category](https://sbulav.github.io/categories/#nix)

### Useful NIX commands

Quickly try out new package in the shell without installing it:

```sh
nix shell nixpkgs#glow
```

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


## Tools installation(Obsolete)

Run make and specify tool to install:

```bash
> make
