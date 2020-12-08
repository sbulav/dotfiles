# Defined in - @ line 1
function gpo --wraps='git push origin (current_branch)' --wraps='git push origin (git branch --show-current)' --description 'alias gpo=git push origin (git branch --show-current)'
  git push origin (git branch --show-current) $argv;
end
