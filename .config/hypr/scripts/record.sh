#!/bin/bash

RECORD_DIR="$HOME/wf-records"
RECORDER_PROC="wf-recorder"

if pgrep -x "$RECORDER_PROC" > /dev/null; then
    pkill -INT -x "$RECORDER_PROC"
    notify-send "Record stopped"
else
    DATE_NOW=$(date +%Y-%m-%d_%H-%M-%S)
    wf-recorder -f "$RECORD_DIR/$DATE_NOW.mp4" -c libx264 -crf 25 -preset veryfast -c:a aac --audio &
    notify-send "Record started!!" "$DATE_NOW.mp4"
fi
