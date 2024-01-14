#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

if [[ -z $TMUX ]]; then
    tmux new-session -c $selected
else
    tmux new-session -d -c $selected
    tmux switch-client -n
fi
