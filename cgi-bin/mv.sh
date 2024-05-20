#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
cat /tmp/bashfilem-selectlist | while read filename
do
  mv  "$filename" "$path"
done
echo 'Content-type:text/html'

