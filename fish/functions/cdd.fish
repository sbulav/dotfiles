# Defined in - @ line 1
function cdd --wraps='~/dotnix' --wraps='cd ~/dotnix' --description 'alias cdd=cd ~/dotnix'
  cd ~/dotfiles/nix $argv;
end
