function posix-source --description 'Set env variables like in POSIX'
  if status --is-login
    for i in (cat $argv)
      set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
  end
end
