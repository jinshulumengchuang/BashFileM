#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
minetype=`xdg-mime query filetype $path`
echo 'Content-Type:' "$minetype"
echo ''
test "$path" && cat "$path"
