#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
test "$1" && path="$1"
test "$2" || echo 'Content-type:text/html'
echo ''
dir=`find "$path"  -maxdepth 1  -type d`
file=`find "$path"  -maxdepth 1  -type f,l`
cat <<EOF
  <div id="progress" style="display: none;" class="mdui-progress">
    <div class="mdui-progress-indeterminate"></div>
  </div>
  <table class="mdui-table">
    <thead><tr><th>Filename</th><th><a onclick="myselectall()">Select</a></th></tr></thead><tbody>
EOF
i=0
echo "$dir" | while read filename
do
filename2=`echo "$filename"|tr '/' '\n'| tail -n1`
test "$filename" || break
test $i  -eq 0 || cat <<EOF
   <tr>
   <td><a href="index.sh?$filename">$filename2 </a></td> <td><label class="mdui-checkbox">
   <input type="checkbox"   onclick="myselect('$filename')" id="$filename" >
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
filename2=`echo "$filename"|tr '/' '\n'| tail -n1`
test "$filename" || break
#test $i  -eq 0 ||
cat <<EOF
   <tr>
   <td><a href="javascript:xopen('$filename')" onclick=""> $filename2 </a></td> <td><label class="mdui-checkbox">
   <input type="checkbox"   onclick="myselect('$filename')" id="$filename" >
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
<script>
document.getElementById('path').value = '$path'
</script>
EOF

