
# Reload shell
function reload
  source ~/.config/fish/config.fish
end

# GIT heart FZF
# -------------

function is_in_git_repo
	git rev-parse --git-dir > /dev/null 2>&1
end

function fzf-down
  fzf --height 50% $argv --border --ansi
end

function gf -d "Show modified files in GIT directory"
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview 'git diff --color=always -- {-1} | sed 1,4d; cat {-1} \
    | head -500' | cut -c4- | sed 's/.* -> //'
end

function gb -d "Show branches and list of branch commits in GIT directory"
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort | \
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always \
    --pretty="format:%C(auto)%cd %h%d %s" (echo {} | rev | cut -f1 -d" " | rev) \
    | head -'$LINES | \
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
end

function gt -d "Show list of tags in GIT directory"
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
end

function ghh -d "Show commit history and selected commit diff"
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'echo {} | grep -o "[a-f0-9]\{7,\}" | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
end

function gr -d "Show list of existing git remotes"
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d' ' -f1
end

function ghi -d "Github: View Open Issues"
  is_in_git_repo || return
  gh issue list | 
  fzf-down --ansi --no-sort \
    --preview 'gh issue view (echo {} | cut -f1)' \
    --bind "enter:execute(gh issue view --web (echo {} | cut -f1))"
end

function ghprl -d "Github: View Open PRs"
  is_in_git_repo || return
  gh pr list -L100 |
  fzf-down --ansi --no-sort \
    --preview 'gh pr view (echo {} | cut -f1)' \
    --bind "enter:execute(gh pr view --web (echo {} | cut -f1))"
end

function ghprr -d "Github: View Open PRs needing my review"
  is_in_git_repo || return
  gh pr list -L100 --search "is:open is:pr review-requested:@me" |
  fzf-down --ansi --no-sort \
    --preview 'gh pr view (echo {} | cut -f1)' \
    --bind "enter:execute(gh pr view --web (echo {} | cut -f1))"
end

bind \cg\cf gf
bind \cg\cg gb
bind \cg\ct gt
bind \cg\ch ghh
bind \cg\cr gr

if bind -M insert > /dev/null 2>&1
  bind -M insert \cg\cf gf
  bind -M insert \cg\cg gb
  bind -M insert \cg\ct gt
  bind -M insert \cg\ch ghh
  bind -M insert \cg\cr gr
end
