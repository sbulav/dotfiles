function posix-source --description 'Set env variables like in POSIX'
  if status --is-login
    for line in (cat $argv)
      # Split only on the first '='
      set key (echo $line | cut -d '=' -f 1)
      set value (echo $line | cut -d '=' -f 2-)
      # Export the variable
      set -gx $key $value
    end
  end
end
