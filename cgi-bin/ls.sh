#!/bin/bash
echo 'Content-type:text/html'
echo ''
cat <<EOF
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../mdui/css/mdui.min.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport"/>
</head>
<body>
EOF
path=`python3 decoder.py "$QUERY_STRING"`
dir=`find "$path"  -maxdepth 1  -type d`
file=`find "$path"  -maxdepth 1  -type f,l`
cat <<EOF
<table class="mdui-table">
<thead><tr><th>Path</th><th>Select</th></tr></thead><tbody>
EOF
i=0
echo "$dir" | while read filename
do
test $filename || break
test $i  -eq 0 || cat <<EOF
   <tr>
   <td onclick="enter('$filename')"> $filename </td> <td><label class="mdui-checkbox">
   <input type="checkbox"   onclick="myselectdir('$filename')" id="$filename" >
   </input>
   <i  class="mdui-checkbox-icon">
   </i>
   </label>
   </td>
   </tr>
EOF
i=$(( $i + 1 ))
done
i=0
echo "$file" | while read filename
do
test $i  -eq 0 || cat <<EOF
   <tr>
   <td onclick="xopen('$filename')"> $filename </td> <td><label class="mdui-checkbox">
   <input type="checkbox"   onclick="myselectfile('$filename')" id="$filename" >
   </input>
   <i  class="mdui-checkbox-icon">
   </i>
   </label>
   </td>
   </tr>
EOF
i=$(( $i + 1 ))
done
cat <<EOF
</table>


<script src="../mdui/js/mdui.min.js"></script>
</body>
</html>
EOF
