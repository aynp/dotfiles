function gp --description "Push current branch to remote, creating it if it doesn't exist"
    # Check if we're in a git repository
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Get the current branch name
    set current_branch (git branch --show-current)
    
    if test -z "$current_branch"
        echo "Error: Not on any branch (detached HEAD?)"
        return 1
    end

    echo "Pushing branch '$current_branch' to remote..."
    
    # Push with --set-upstream to create the branch on remote if it doesn't exist
    git push --set-upstream origin $current_branch
end 