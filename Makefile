ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
NEOVIM ?= /usr/local/bin/nvim
TERRAFORM_VERSION ?= 1.0.3
GH_VERSION ?= 2.4.0
FZF_VERSION ?= 0.24.2
HOST ?= one-ingress.tst.k8s.ecom.ahold.nl
.DEFAULT: help


.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## tools               : Install neovim, rg, fzf, etc..
tools: neovim fzf ripgrep k9s terraform gh

## neovim              : Update neovim to nightly version
.PHONY : neovim
neovim: /tmp/nvim.appimage
	@echo "----Making Tool Neovim-----"
	@sudo cp /tmp/nvim.appimage $(NEOVIM)
	@sudo chmod +x $(NEOVIM)
	#curl -s https://github.com/neovim/neovim/commits/master | grep Merge |  cut -d '"' -f2 | cut -d '"' -f1 | grep Merge
	# @sudo dnf install neovim -y
	# @nvim --version | head -1

## fzf                 : Update fzf to nightly version
.PHONY : fzf
fzf: /tmp/fzf.tgz
	@echo "----Making Tool fzf-----"
	@sudo tar xvf /tmp/fzf.tgz -C /usr/local/bin/ --overwrite
	@fzf --version | head -1

## k9s                 : Update k9s to nightly version
.PHONY : k9s
k9s: /tmp/k9s.tgz
	@echo "----Making Tool k9s-----"
	@sudo tar xvf /tmp/k9s.tgz -C /usr/local/bin/ --overwrite
	@k9s version | tail -3

## gh                  : Update gh to nightly version
.PHONY : gh
gh: /tmp/gh.tgz
	@echo "----Making Tool gh-----"
	@sudo tar xvf /tmp/gh.tgz --strip-components 2 -C /home/sab/bin/ gh_$(GH_VERSION)_linux_amd64/bin/gh
	@gh version

## ripgrep             : Update ripgrep to latest release
.PHONY : ripgrep
ripgrep: /tmp/ripgrep.deb
	@echo "----Making Tool ripgrep-----"
	#@sudo dpkg -i /tmp/ripgrep.deb
	sudo dnf install ripgrep -y

## terraform           : Update terraform to latest release
.PHONY : terraform
terraform: /tmp/terraform.zip
	@echo "----Making Tool terraform-----"
	@unzip -o /tmp/terraform.zip -d /home/sab/bin
	@terraform version

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

## colemak             : Install colemak-dhm
.PHONY : colemak
colemak:
	git clone git@github.com:DreymaR/BigBagKbdTrixXKB.git /home/sab/git_priv
	sudo bash /home/sav/git_priv/install-dreymar-xmod.sh -ox
	echo "Now reboot"
	echo "After reboot, go to settings->keyboard and pick english(us)->colemak[ed],Curl-DH"

## symlinks            : Create symliks to configs
.PHONY : symlinks
symlinks:
	ln -s /home/sab/dotfiles/nvim/ /home/sab/.config/nvim || true
	ln -s /home/sab/dotfiles/tmux/.tmux.conf .tmux.conf || true
	ln -s /home/sab/dotfiles/tmux/plugins/kube-tmux/ .tmux || true
	rm -rf /home/sab/.config/fish || true
	ln -s /home/sab/dotfiles/fish /home/sab/.config/fish || true

## /tmp/nvim.appimage  : Download nightly nvim appimage
/tmp/nvim.appimage:
	@curl -s -S -L -f https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -z $@ -o $@

## /tmp/fzf.tgz        : Download latest fzf release
/tmp/fzf.tgz:
	curl -s -S -L -f https://github.com/junegunn/fzf/releases/download/$(FZF_VERSION)/fzf-$(FZF_VERSION)-linux_amd64.tar.gz -z $@ -o $@

## /tmp/k9s.tgz        : Download latest k9s release
/tmp/k9s.tgz:
	@curl -s -S -L -f https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64.tar.gz -z $@ -o $@

## /tmp/gh.tgz         : Download latest gh release
/tmp/gh.tgz:
	@curl -s -S -L -f https://github.com/cli/cli/releases/download/v$(GH_VERSION)/gh_$(GH_VERSION)_linux_amd64.tar.gz -z $@ -o $@

## /tmp/ripgrep.deb    : Download latest ripgrep release
/tmp/ripgrep.deb:
	@curl -s -S -L -f https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb -z $@ -o $@

## /tmp/terraform.zip  : Download latest terraform release
/tmp/terraform.zip:
	@curl -s -S -L -f https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip -z $@ -o $@
