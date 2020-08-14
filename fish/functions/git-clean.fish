# Defined in - @ line 1
function git-clean --wraps=git\ branch\ --merged\ \|\ egrep\ -v\ \"\(\^\\\*\|master\|dev\)\"\ \|\ xargs\ git\ branch\ -d\;git\ remote\ prune\ origin --description alias\ git-clean=git\ branch\ --merged\ \|\ egrep\ -v\ \"\(\^\\\*\|master\|dev\)\"\ \|\ xargs\ git\ branch\ -d\;git\ remote\ prune\ origin
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d;git remote prune origin $argv;
end
