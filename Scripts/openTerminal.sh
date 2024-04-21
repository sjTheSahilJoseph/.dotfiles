#!/bin/bash

for i in {1..3}; do
    session="s$i"
    tmux new-session -d -s $session -n "vim"
    tmux new-window -t $session: -n "run"
    tmux new-window -t $session: -n "auxiliary"
    tmux new-window -t $session: -n "music"
    tmux new-window -t $session: -n "temp"
done

tmux attach-session -t s1
