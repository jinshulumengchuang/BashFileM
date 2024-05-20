#!/usr/bin/python3
import cgi, os
import cgitb; cgitb.enable()
form = cgi.FieldStorage()
fileitem = form['file']
path = form.getvalue("path")
fn = os.path.basename(fileitem.filename)
open(path + '/' + fn, 'wb').write(fileitem.file.read())
message = 'The file "' + fn + '" was uploaded successfully'
print("Content-type:text/html")
print("")
print("Done")
