#!/usr/bin/python3
import urllib.parse
import sys
url = str(sys.argv[1])
x = urllib.parse.unquote(url)
print(x)
