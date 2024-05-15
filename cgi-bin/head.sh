#!/bin/bash
echo 'Content-type:text/html'
echo ''
cat <<EOF
<!DOCTYPE html>
<html>
<head>
<script>
function activv(activ) {
active =  activ
}
</script>
<link rel="stylesheet" href="../mdui/css/mdui.min.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<title>BashFileM</title>
<div class="mdui-appbar  mdui-appbar-fixed">
<div class="mdui-toolbar mdui-color-green">
<a  class="mdui-typo-title">BashFileM</a>
</div>
<div class="mdui-tab mdui-tab-full-width" mdui-tab>
  <a href="#tab1"  onclick="activv('tab1')" class="mdui-ripple  mdui-color-green">tab1</a>
  <a href="#tab2" onclick="activv('tab2')" class="mdui-ripple mdui-color-green">tab2</a>

</div>
</div>

</head>
<body class="mdui-appbar-with-tab-larger">
<br>
<br>


EOF
