# Defined in - @ line 1
function ll --wraps='ls -la' --description 'alias ll=ls -la'
  ls -la $argv;
end
