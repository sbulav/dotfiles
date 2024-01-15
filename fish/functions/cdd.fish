# Defined in - @ line 1
function cdd --wraps='~/dotfiles/nix' --wraps='cd ~/dotfiles/nix' --description 'alias cdd=cd ~/dotfiles/nix'
  cd ~/dotfiles/nix $argv;
end
