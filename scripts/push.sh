#!/usr/bin/env sh

branch_to_push="$(git symbolic-ref --short HEAD)"

window="pushing-${branch_to_push}"

tmux new-window -n $window -d
tmux send-keys -t $window 'cd ~/Documents/rails_projects/e2e-rewards-dashboard' C-m

tmux send-keys -t $window "git checkout $branch_to_push" C-m
tmux send-keys -t $window "git push --force origin $branch_to_push" C-m
tmux send-keys -t $window "say Pushed $branch_to_push" C-m
tmux send-keys -t $window "exit" C-m
