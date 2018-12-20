# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Set correct TMux pane name
if shopt -q login_shell; then
  printf "\033k$(whoami)@$(hostname)\033\\";
fi
