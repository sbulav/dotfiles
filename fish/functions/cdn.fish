# Defined in - @ line 1
function cdn --wraps='~/dotfiles/nvim' --wraps='cd ~/dotfiles/nvim' --description 'alias cdn=cd ~/dotfiles/nvim'
  cd ~/dotfiles/nvim $argv;
end
