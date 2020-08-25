function kgjq --description "Parse json with jq and fzf"
set FZF_DEFAULT_OPTS '';kubectl get $argv -o json > /tmp/kf.json;echo ''  | fzf --print-query --preview 'jq {q} /tmp/kf.json';
end
