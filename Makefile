ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
NEOVIM ?= /usr/local/bin/nvim
HOST ?= one-ingress.tst.k8s.ecom.ahold.nl
.DEFAULT: help


.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## tools               : Install neovim, rg, fzf, etc..
tools: neovim fzf ripgrep k9s

## neovim              : Update neovim to nightly version
.PHONY : neovim
neovim: /tmp/nvim.appimage
	@sudo cp /tmp/nvim.appimage $(NEOVIM)
	@sudo chmod u+x $(NEOVIM)
	@nvim --version | head -1
	@curl -s https://github.com/neovim/neovim/commits/master | grep Merge |  cut -d '"' -f2 | cut -d '"' -f1 | grep Merge

## fzf                 : Update fzf to nightly version
.PHONY : fzf
fzf: /tmp/fzf.tgz
	@sudo tar xvf /tmp/fzf.tgz -C /usr/local/bin/ --overwrite
	@fzf --version | head -1

## k9s                 : Update k9s to nightly version
.PHONY : k9s
k9s: /tmp/k9s.tgz
	@sudo tar xvf /tmp/k9s.tgz -C /usr/local/bin/ --overwrite
	@k9s version | head -1

## ripgrep             : Update ripgrep to latest release
.PHONY : ripgrep
ripgrep: /tmp/ripgrep.deb
	@sudo dpkg -i /tmp/ripgrep.deb
	@fzf --version | head -1


## dotfiles            : Update dotfiles to latest version
.PHONY : dotfiles
dotfiles:
	cd $(ROOT_DIR)/dotfiles && git pull

## alpine              : Run alpine container for tests
.PHONY : alpine
alpine:
	podman run -it python:alpine3.11   /bin/sh

## nginx-conf          : Get ingress configuration for host
.PHONY : nginx-conf
nginx-conf:
	kubectl ingress-nginx conf -n ingress-nginx -l app=ingress-nginx --host $(HOST) > /tmp/nginx-config-$(HOST).yaml

## kk-tools            : Run tools containers in current cluster
.PHONY : kk-toools
kk-tools:
	kubectl run tools --image=docker-registry-dev.ecom.ahold.nl/tools-report:3 --restart=Never --rm -it /bin/bash
#kk port-forward svc/dev-myah-be-ah-tomcat 8080:8080 --address=0.0.0.0
#kubectl ingress-nginx --service=nginx-ingress-controller -n kube-system info

## /tmp/nvim.appimage  : Download nightly nvim appimage
/tmp/nvim.appimage:
	curl -s -S -L -f https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -z $@ -o $@

## /tmp/fzf.tgz        : Download latest fzf release
/tmp/fzf.tgz:
	curl -s -S -L -f https://github.com/junegunn/fzf-bin/releases/download/0.22.0/fzf-0.22.0-linux_amd64.tgz -z $@ -o $@

## /tmp/k9s.tgz        : Download latest k9s release
/tmp/k9s.tgz:
	curl -s -S -L -f https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64.tar.gz -z $@ -o $@

## /tmp/ripgrep.deb    : Download latest ripgrep release
/tmp/ripgrep.deb:
	curl -s -S -L -f https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb -z $@ -o $@