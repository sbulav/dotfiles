#function load_keys --description 'Load keys from .ssh folder starting with id_'
#  if status --is-login
#    for key in (ls $HOME/.ssh/id_* | grep -v pub)
#      ssh-add -q  $key
#    end
#  end
#end
