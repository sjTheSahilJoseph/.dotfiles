#!/bin/bash

CHECK_CMD="pgrep -x screenkey"

if $CHECK_CMD > /dev/null; then
    pkill -x screenkey
else
    screenkey -p fixed -g 90%x10%+5%-10 &
fi

