#!/bin/bash
echo 'Content-type:text/html'
echo ''
cat  <<EOF
<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <title>Upload</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
  </head>
  <body>
    <form enctype="multipart/form-data" method="post" action="upload.py">
      <input type="file" name="file">
      Path:
      <input id="path" name="path"/>
      <input type="submit" value="Upload">
    </form>
    <script>
       path = localStorage.getItem('path')
       document.getElementById('path').value = path
    </script>
  </body>
</html>
EOF
