#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
cat /tmp/bashfilem-selectlist | while read filename
do
  cp -fa "$filename" "$path"
done
rm /tmp/bashfilem-selectlist
echo 'Content-type:text/html'

