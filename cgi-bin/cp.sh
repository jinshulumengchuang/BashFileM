#!/bin/bash
echo 'Content-type:text/html'
echo ''
path=`python3 decoder.py "$QUERY_STRING"`
q=`echo "$path"|tr '&' '\n'|head -n1`
b=`echo "$path"|tr '&' '\n'|tail -n1`
cp -a "$q" "$b"
