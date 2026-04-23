function git-clean --wraps=git\ branch\ --merged\ \|\ egrep\ -v\ \"\(\^\\\*\|master\|dev\)\"\ \|\ xargs\ git\ branch\ -d\;git\ remote\ prune\ origin --description alias\ git-clean=git\ branch\ --merged\ \|\ egrep\ -v\ \"\(\^\\\*\|master\|dev\)\"\ \|\ xargs\ git\ branch\ -d\;git\ remote\ prune\ origin
  argparse 'f/force' -- $argv; or return
  set -l del_flag -d
  if set -q _flag_force
    set del_flag -D
  end
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch $del_flag
  git remote prune origin $argv
end
