# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Use more colorful scheme
export TERM=xterm-24bit
#export TERM=screen-256color


# Set default editor to VIM
export EDITOR=nvim
export VISUAL=nvim

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

alias cat='bat -p'

alias kk=kubectl
alias kubens='kubectl config set-context --current --namespace '

alias vim=nvim
alias vi=nvim

# Connect to existing tmux session; start a new one otherwise
if shopt -q login_shell; then
  tmux ls 2>&1 >/dev/null && tmux a|| tmux
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

# Command prompt with current GIT branch and status
# (branch *) means a tracked file is modified
# (branch +) means a tracked file is modified and staged with git add
# (branch %) means untracked files are in your tree
GIT_PROMPT_SCRIPT=/usr/share/git-core/contrib/completion/git-prompt.sh
if [ -f "${GIT_PROMPT_SCRIPT}" ]; then
    source ${GIT_PROMPT_SCRIPT}
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    #export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
    export PS1='[\u@\h \W]\[\033[33m\]$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")\[\033[00m\]$ '
else
    export PS1='[\u@\h \W]$ '
fi
