function git-clean --description 'Delete merged local branches and prune remote tracking refs'
    argparse 'f/force' 'n/dry-run' -- $argv; or return

    set -l del_flag -d
    if set -q _flag_force
        set del_flag -D
    end

    set -l branches (git branch --merged HEAD \
        | grep -Ev '^\*|^[[:space:]]*(master|main|dev|develop)[[:space:]]*$' \
        | string trim)

    if test (count $branches) -eq 0
        echo "git-clean: no merged branches to delete"
        return 0
    end

    if set -q _flag_dry_run
        echo "git-clean: branches that would be deleted:"
        for b in $branches
            echo "  $b"
        end
        echo "git-clean: would also run: git remote prune origin"
        return 0
    end

    for b in $branches
        git branch $del_flag $b
    end

    git remote prune origin
end
