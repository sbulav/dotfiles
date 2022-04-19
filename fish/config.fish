# Append paths
set -a PATH "$HOME/bin/" "$HOME/.local/bin" "/opt/homebrew/bin" "$HOME/./go/bin/" "$HOME/Library/Python/3.8/bin/"

# Initialize FZF keybindings
fzf_key_bindings

# Set terminal
set -g TERM screen-256color

# Set correct locale
set -x LANG en_US.UTF-8

# Set EDITOR to nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# Use python3 as default on Mac
set -gx PATH "/usr/local/opt/python/libexec/bin" $PATH

# Set KUBECONFIG
set -gx KUBECONFIG "$HOME/.kube/all-merged"

# Add krew to path
set -gx PATH $PATH $HOME/.krew/bin

# Do not complete CRD, to speed things up
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# Set GPG_TTY for commit signing
set -gx GPG_TTY $(tty)

# Load ssh keys into ssh-agent
load_keys

# Load env credentials
if begin; test -f ~/.ssh/env-credentials;end
posix-source ~/.ssh/env-credentials
end

# git_prompt
# number of untracked files, dirty files, unpushed/unpulled commits, and more.
set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_hide_untrackedfiles 1
set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showupstream 'auto'
set __fish_git_prompt_color_branch yellow

# Configure FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-follow --color never --glob "!{.git,node_modules}/*"'
set -gx FZF_ALT_C_COMMAND 'fd --type directory \
  --exclude ".git" \
  --exclude "venv*" \
  --exclude "*node_modules*" \
  --exclude "*ctags*" \
  --exclude "Library" \
  --exclude "Music" '

set -gx FZF_CTRL_T_COMMAND 'fd --type file \
  --exclude ".git" \
  --exclude "venv*" \
  --exclude "*node_modules*" \
  --exclude "*ctags*" \
  --exclude "Library" \
  --exclude "Music" '

# Smart fzf preview window
set -gx FZF_DEFAULT_OPTS "--height 50% -1 --layout=reverse-list --multi \
  --preview='set -l data (file --mime {}); \
  string match -q \"*binary\" \$data \
  && echo \"Binary file\"\n\$data \
  || bat --style=numbers --color=always {} 2>/dev/null; \
  or echo {}'"

# Fix MTU under VPN in WSL2
#sudo ip link set dev eth0 mtu 1350
