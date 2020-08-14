# Initialize FZF keybindings
fzf_key_bindings
# Set terminal
set -g TERM xterm-256color
# Append paths
set -a PATH "$HOME/bin/" "$HOME/.local/bin" "$HOME/.krew/bin" "$HOME/.rvm/bin/"
# Set EDITOR to nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# Set KUBECONFIG
set -gx KUBECONFIG "$HOME/.kube/all-merged"
# Do not complete CRD, to speed things up
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# Load ssh keys into ssh-agent
load_keys

# git_prompt
# Configure FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files'
set -gx FZF_DEFAULT_OPTS "--height 50% -1 --layout=reverse-list --multi --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"
