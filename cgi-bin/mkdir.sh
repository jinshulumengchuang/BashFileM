#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
test "$path" && mkdir "$path"
