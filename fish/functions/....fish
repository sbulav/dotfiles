# Defined in - @ line 1
function ... --wraps='cd (git rev-parse --show-toplevel)' --description 'alias ...=cd (git rev-parse --show-toplevel)'
  cd (git rev-parse --show-toplevel) $argv;
end
