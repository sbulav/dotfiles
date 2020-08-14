# Defined in - @ line 1
function cat --wraps='bat -p' --description 'alias cat=bat -p'
  bat -p $argv;
end
