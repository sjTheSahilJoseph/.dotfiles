#!/bin/bash

tmux new-session -d -s primary -n "code"

tmux new-window -t primary: -n "run"
tmux new-window -t primary: -n "auxiliary"
tmux new-window -t primary: -n "music"
tmux new-window -t primary: -n "temp"

tmux attach-session -t primary

tmux select-window -t primary:code
