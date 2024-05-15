#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
echo 'Content-Type: application/octet-stream'
echo ''
test "$path" && cat "$path"
