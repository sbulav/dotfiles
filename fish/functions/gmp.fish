function gmp --description 'Git stash (if needed), switch to main/master, pull latest changes, and pop stash'

    # Navigate to the root of the git repo
    cd (git rev-parse --show-toplevel)

    # Check if there are unstaged or staged changes
    set changes (git status --porcelain)

    # Track if we created a stash
    set stash_created 0

    if test -n "$changes"
        echo "Uncommitted changes detected, stashing..."
        # Create a stash with a message including timestamp
        git stash push -m "Auto-stash before gmp $(date '+%Y-%m-%d %H:%M:%S')"
        set stash_created 1
    else
        echo "No uncommitted changes detected."
    end

    # Detect primary branch: try main first, then master
    set branch main
    if not git show-ref --verify --quiet refs/heads/main
        if git show-ref --verify --quiet refs/heads/master
            set branch master
        else
            echo "Neither 'main' nor 'master' branch exists locally. Exiting."
            return 1
        end
    end

    echo "Switching to branch '$branch'..."
    git checkout $branch

    echo "Pulling latest changes from origin/$branch..."
    git pull origin $branch

    # If we created a stash, pop it back
    if test $stash_created -eq 1
        echo "Restoring stashed changes..."
        git stash pop
    end

    echo "Done."
end
