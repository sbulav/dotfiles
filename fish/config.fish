# Initialize FZF keybindings
fzf_key_bindings

# Set terminal
set -g TERM xterm-256color

# Append paths
set -a PATH "$HOME/bin/" "$HOME/.local/bin"

# Set EDITOR to nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# Set KUBECONFIG
set -gx KUBECONFIG "$HOME/.kube/all-merged"

# Add krew to path
set -gx PATH $PATH $HOME/.krew/bin

# Do not complete CRD, to speed things up
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# Load ssh keys into ssh-agent
load_keys

# git_prompt
# number of untracked files, dirty files, unpushed/unpulled commits, and more.
set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_hide_untrackedfiles 1
set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_color_branch yellow

# Configure FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files'

# Smart fzf preview window
set -gx FZF_DEFAULT_OPTS "--height 50% -1 --layout=reverse-list --multi \
  --preview='set -l data (file --mime {}); \
  string match -q \"*binary\" \$data \
  && echo \"Binary file\"\n\$data \
  || bat --style=numbers --color=always {} 2>/dev/null; \
  or echo {}'"

# Fix MTU under VPN in WSL2
#sudo ip link set dev eth0 mtu 1350
