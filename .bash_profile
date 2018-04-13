# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
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
tmux a || tmux
