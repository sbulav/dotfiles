# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin:${HOME}/.krew/bin:

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
export HISTSIZE=50000
export HISTFILESIZE=50000

# Use ll alias
alias ll='ls -la'

# Show my bash tips
alias helpb="cat .bash_help|less"

# Show my vim tips
alias helpv="cat .vim_help|less"

alias cat='bat -p'

alias kk=kubectl

alias vim=nvim
alias vi=nvim

alias git-clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d;git remote prune origin'
alias git-checkout='git checkout $(git branch -l | fzf)'

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



# FZF mappings and options
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS="--height 50% -1 --layout=reverse-list --multi --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

# Get kubernetes #kind #name and parse it in jq
kgjq() { (FZF_DEFAULT_OPTS='';kubectl get $* -o json > /tmp/kf.json;echo ''  | fzf --print-query --preview 'jq {q} /tmp/kf.json';) }

# Get kubernetes #kind #name, preview in  yaml and open on enter in nvim
kg() {
    kubectl get $1 -o name | \
        fzf --query="${@: -1}" \
            --preview 'kubectl get {}' \
            --bind "ctrl-s:execute(kubectl get {+} | bat --paging=always)" \
            --bind "ctrl-d:execute(kubectl describe {+} | bat --paging=always)" \
            --bind "ctrl-\:execute(kubectl get {+} -o yaml --export | nvim +'set ft=yaml')" \
            --bind "ctrl-r:reload(kubectl get $1 -o name)" --header "Press CTRL-R to reload resource:$1" \
            --bind "ctrl-l:execute(kubectl logs --tail=100 {+} | bat)" \
            --bind "ctrl-]:execute(kubectl edit {+})";
     }
#Get kubernetes resources and limits in current namespace
kgreq() {
  kubectl get pods  -o=custom-columns='NAME:spec.containers[*].name,MEMREQ:spec.containers[*].resources.requests.memory,MEMLIM:spec.containers[*].resources.limits.memory,CPUREQ:spec.containers[*].resources.requests.cpu,CPULIM:spec.containers[*].resources.limits.cpu'
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

