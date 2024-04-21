#!/bin/bash

    session="learning"
    tmux new-session -d -s $session -n "english"
    tmux new-window -t $session: -n "computer"
    tmux new-window -t $session: -n "mathematics"
    tmux new-window -t $session: -n "physics"
    tmux new-window -t $session: -n "files"
    tmux new-window -t $session: -n "temp"

    session="work1"
    tmux new-session -d -s $session -n "vim"
    tmux new-window -t $session: -n "run"
    tmux new-window -t $session: -n "auxiliary"
    tmux new-window -t $session: -n "music"
    tmux new-window -t $session: -n "files"
    tmux new-window -t $session: -n "temp"

    session="work2"
    tmux new-session -d -s $session -n "vim"
    tmux new-window -t $session: -n "run"
    tmux new-window -t $session: -n "auxiliary"
    tmux new-window -t $session: -n "music"
    tmux new-window -t $session: -n "files"
    tmux new-window -t $session: -n "temp"

    session="work3"
    tmux new-session -d -s $session -n "vim"
    tmux new-window -t $session: -n "run"
    tmux new-window -t $session: -n "auxiliary"
    tmux new-window -t $session: -n "music"
    tmux new-window -t $session: -n "files"
    tmux new-window -t $session: -n "temp"

    session="teaching"
    tmux new-session -d -s $session -n "vim"
    tmux new-window -t $session: -n "run"
    tmux new-window -t $session: -n "auxiliary"
    tmux new-window -t $session: -n "music"
    tmux new-window -t $session: -n "files"
    tmux new-window -t $session: -n "temp"


tmux attach-session -t learning
