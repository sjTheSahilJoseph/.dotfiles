#!/bin/bash

CHECK_CMD="pgrep -x screenkey"

if $CHECK_CMD > /dev/null; then
    pkill -x screenkey
else
    screenkey 
fi

