# Defined in - @ line 1
function myip --wraps='dig +short myip.opendns.com @resolver1.opendns.com' --description 'alias myip=dig +short myip.opendns.com @resolver1.opendns.com'
  dig +short myip.opendns.com @resolver1.opendns.com $argv;
end
