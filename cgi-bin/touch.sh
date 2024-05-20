#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
test -e "$path" && exit
test "$path" && touch "$path" && echo 'Content-type:text/html'

