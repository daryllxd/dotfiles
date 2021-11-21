#!/usr/bin/env sh

if [ $1 ]; then
  branch_to_merge=$1
else
  branch_to_merge="$(git symbolic-ref --short HEAD)"
fi

window="merging-${branch_to_merge}"

tmux new-window -n $window -d
tmux send-keys -t $window 'echo hello' C-m
tmux send-keys -t $window 'cd ~/Documents/rails_projects/e2e-rewards-dashboard-clone' C-m

tmux send-keys -t $window "git fetch" C-m
tmux send-keys -t $window "git checkout $branch_to_merge" C-m
tmux send-keys -t $window 'git checkout develop' C-m
tmux send-keys -t $window "git merge $branch_to_merge --no-edit" C-m
tmux send-keys -t $window "git push" C-m
tmux send-keys -t $window "say Merged ${branch_to_merge}" C-m
tmux send-keys -t $window "exit" C-m
