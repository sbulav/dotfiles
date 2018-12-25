# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
eval $(ssh-agent -s)
ssh-add /root/.ssh/id_rsa
ssh-add /root/.ssh/id_rsa_priv
# Use more colorful scheme
export TERM=xterm-256color
# Set default editor to VIM
export EDITOR=vim
# Don't clear less output
export LESS="-X"

export PATH
alias ll='ls -la'

# Show my bash tips
alias helpb="cat .bash_help|less"
# Connect to existing tmux session; start a new one otherwise
if shopt -q login_shell; then
  tmux ls 2>/dev/null && tmux a|| tmux
fi
