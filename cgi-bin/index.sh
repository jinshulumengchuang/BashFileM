#!/bin/bash
path=`python3 decoder.py "$QUERY_STRING"`
echo 'Content-type:text/html'
echo ''
cat <<EOF
<!DOCTYPE html>
<html>
<head>
<style>
a {
color: inherit;
Text-decoration: none;
}
</style>
<link rel="stylesheet" href="https://unpkg.com/mdui@1.0.2/dist/css/mdui.min.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<title>BashFileM</title>
<div class="mdui-appbar  mdui-appbar-fixed">
  <div class="mdui-toolbar mdui-color-green">
    <a  class="mdui-typo-title">BashFileM</a>
    <div class="mdui-toolbar-spacer"></div>
    <a id="newtab" target="view_window" class="mdui-btn mdui-btn-icon" ><i class="mdui-icon material-icons">add</i></a>
    <a mdui-dialog="{target: '#settings-dialog'}" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">settings</i></a>

  </div>
</div>
</head>
<body>
<br>
<br>
<br>
<br>
EOF
cat <<EOF
<a style="display:none" id="open" target="view_window" > </a>
<a style="display:none" id="down" target="view_window" download > </a>
<a style="display:none" id="enter" ></a>
<a style="display:none" href="upload.sh" id="upload" target="view_window"></a>

<div  class="mdui-dialog" id="delalert" >
  <div class="mdui-dialog-title">Are you sure?</div>
  <div class="mdui-dialog-actions">
    <button class="mdui-btn mdui-ripple" mdui-dialog-close>Cancel</button>
    <button onclick="rm()" class="mdui-btn mdui-ripple" mdui-dialog-close>Destory</button>
  </div>
</div>
<div  class="mdui-dialog" id="settings-dialog" >
  <div class="mdui-dialog-title">Settings</div>
    <p>Default Open Method:</p><p id="method"></p>
      <a class="mdui-btn mdui-btn-raised mdui-color-green" onclick="mymethod('Local')">Open Locally</a>
      <a class="mdui-btn mdui-btn-raised mdui-color-green" onclick="mymethod('Download')" >Download</a>
      <a class="mdui-btn mdui-btn-raised mdui-color-green" onclick="mymethod('Browser')" >Open in Browser</a>
    </select>
  <div class="mdui-dialog-actions">
    <button class="mdui-btn mdui-ripple" mdui-dialog-close>Close</button>
  </div>
</div>
<div class="mdui-dialog" id="mkdir-dialog">
      <div class="mdui-dialog-title">Name:</div>
        <input  id="fname" class="mdui-textfield-input" type="text" placeholder="Name"/>
      <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>cancel</button>
        <button onclick="mkdir()" class="mdui-btn mdui-ripple" mdui-dialog-confirm>confirm</button>
      </div>
</div>
<div class="mdui-dialog" id="touch-dialog">
      <div class="mdui-dialog-title">Name:</div>
      <input  id="touchname" class="mdui-textfield-input" type="text" placeholder="Name"/>
      <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>cancel</button>
        <button onclick="touch()" class="mdui-btn mdui-ripple" mdui-dialog-confirm>confirm</button>
      </div>
</div>
<div  class="mdui-textfield mdui-color-white" style="position: fixed; bottom: 0px; z-index: 999;width: 100%">
  <input  id="path" class="mdui-textfield-input" type="text" placeholder="Path"/>
  <div class="mdui-tab" >
    <button onclick="enter()" class="mdui-btn mdui-btn-raised mdui-color-green">Enter</button>
    <button  mdui-dialog="{target: '#mkdir-dialog'}" class="mdui-btn mdui-btn-raised mdui-color-green">New Folder</button>
    <button  mdui-dialog="{target: '#touch-dialog'}" class="mdui-btn mdui-btn-raised mdui-color-green">New File</button>
    <button onclick="myupload()" class="mdui-btn mdui-btn-raised mdui-color-green">Upload</button>
    <button onclick="mypushselect()" class="mdui-btn mdui-btn-raised mdui-color-green">Select</button>
    <button onclick="mv()" id="mvbutton"  class="mdui-btn mdui-btn-raised mdui-color-green">Move</button>
    <button onclick="cp()"  id="cpbutton" class="mdui-btn mdui-btn-raised mdui-color-green">Copy</button>
    <button  mdui-dialog="{target: '#delalert'}" class="mdui-btn mdui-btn-raised mdui-color-green">Remove</button>
  </div>
</div>
<div id="mymain">
EOF
test "$path" || bash ls.sh "$HOME" index
test "$path" && bash ls.sh  "$path" index
cat <<EOF
<script src="../main.js"></script>
<script src="https://unpkg.com/mdui@1.0.2/dist/js/mdui.min.js"></script>
</body>
</html>
EOF
