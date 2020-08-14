# Defined in - @ line 1
function git-checkout --wraps='git checkout (git branch -l | fzf)' --description 'alias git-checkout=git checkout (git branch -l | fzf)'
  git checkout (git branch -l | fzf) $argv;
end
