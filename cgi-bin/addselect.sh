#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
echo "$path" >> /tmp/bashfilem-selectlist && echo 'Content-type:text/html'
