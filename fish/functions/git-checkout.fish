# Defined in - @ line 1
function git-checkout --wraps='git checkout (git branch -l | fzf)' --wraps='git checkout (git branch -l | fzf | tr -d "[:space:]")' --description 'alias git-checkout git checkout (git branch -l | fzf | tr -d "[:space:]")'
  git checkout (git branch -l | fzf | tr -d "[:space:]") $argv;
end
