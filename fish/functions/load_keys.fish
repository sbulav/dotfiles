function load_keys --description 'Load keys from .ssh folder starting with id_rsa'
  if status --is-login
    for key in (ls $HOME/.ssh/id_rsa* | grep -v pub)
      ssh-add -q  $key
    end
  end
end
