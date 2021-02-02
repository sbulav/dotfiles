# Defined in - @ line 1
function gcd --wraps='cd (git rev-parse --show-toplevel)' --description 'alias gcd=cd (git rev-parse --show-toplevel)'
  cd (git rev-parse --show-toplevel) $argv;
end
