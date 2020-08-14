function kg
  kubectl get $argv[1] -o name | \
    fzf --query="$argv[1..-1]" \
      --preview 'kubectl get {}' \
      --bind "ctrl-s:execute(kubectl get {+} | bat --paging=always)" \
      --bind "ctrl-d:execute(kubectl describe {+} | bat --paging=always)" \
      --bind "ctrl-\:execute(kubectl get {+} -o yaml --export | nvim +'set ft=yaml')" \
      --bind "ctrl-r:reload(kubectl get $argv[1] -o name)" --header "Press CTRL-R to reload resource:$argv[1]" \
      --bind "ctrl-l:execute(kubectl logs --tail=100 {+} | bat)" \
      --bind "ctrl-]:execute(kubectl edit {+})";
end
