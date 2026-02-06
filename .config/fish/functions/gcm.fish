function gcm --description "Checkout master branch if it exists, otherwise checkout main branch"
    # Check if we're in a git repository
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Check if master branch exists (locally or remotely)
    if git show-ref --verify --quiet refs/heads/master; or git show-ref --verify --quiet refs/remotes/origin/master
        echo "Checking out master branch..."
        git checkout master
    else if git show-ref --verify --quiet refs/heads/main; or git show-ref --verify --quiet refs/remotes/origin/main
        echo "Master branch not found, checking out main branch..."
        git checkout main
    else
        echo "Error: Neither master nor main branch found"
        return 1
    end
end 
