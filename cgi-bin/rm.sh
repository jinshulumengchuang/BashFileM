#!/bin/bash
cat /tmp/bashfilem-selectlist | while read filename
do
  test "$filename" && rm -r "$filename"
done
echo 'Content-type:text/html'

