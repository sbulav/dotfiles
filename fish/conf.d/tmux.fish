if not set -q TMUX; and status --is-interactive;
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    # tmux attach-session -d -t base
end
