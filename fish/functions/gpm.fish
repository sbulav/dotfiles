# Defined in - @ line 1
function gpm --wraps='git checkout master && git pull master' --description 'Git checkout and pull master branch'
  git checkout master; git pull;
end
