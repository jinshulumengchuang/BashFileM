#!/bin/bash
cat /tmp/bashfilem-selectlist | while read filename
do
  test "$filename" && rm -r "$filename"
done
rm /tmp/bashfilem-selectlist
echo 'Content-type:text/html'

