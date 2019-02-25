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

# Export path
export PATH

# Use ll alias
alias ll='ls -la'

# Show my bash tips
alias helpb="cat .bash_help|less"

# Show my vim tips
alias helpv="cat .vim_help|less"

# Connect to existing tmux session; start a new one otherwise
if shopt -q login_shell; then
  tmux ls 2>/dev/null && tmux a|| tmux
fi

# Set up SSH AGENT
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
    /usr/bin/ssh-add .ssh/id_rsa_priv;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
