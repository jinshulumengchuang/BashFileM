#!/bin/bash
bash head.sh
cat <<EOF
  <a style="display:none" id="down" target="view_window" download > </a>
<div  class="mdui-dialog" id="delalert" >
  <div class="mdui-dialog-title">Are you sure?</div>
  <div class="mdui-dialog-actions">
    <button class="mdui-btn mdui-ripple" mdui-dialog-close>Cancel</button>
    <button onclick="rm()" class="mdui-btn mdui-ripple" mdui-dialog-close>Destory</button>
  </div>
</div>
   <div class="mdui-dialog" id="mkdirr">
      <div class="mdui-dialog-title">Name:</div>
      <input  id="fname" class="mdui-textfield-input" type="text" placeholder="Name"/>
      <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>cancel</button>
        <button onclick="mkdir()" class="mdui-btn mdui-ripple" mdui-dialog-confirm>confirm</button>
      </div>
    </div>
<div id="tab1" class="mdui-p-a-2">
<div  class="mdui-textfield">
  <input  id="tab1path" class="mdui-textfield-input" type="text" placeholder="Path"/>
  <button onclick="myenter('tab1')" class="mdui-btn mdui-btn-raised mdui-color-green">Enter/Refresh</button>
  <button  mdui-dialog="{target: '#mkdirr'}" class="mdui-btn mdui-btn-raised mdui-color-green">New Folder</button>
  <button  mdui-dialog="{target: '#delalert'}" class="mdui-btn mdui-btn-raised mdui-color-green">Remove</button>
  <button onclick="download()"  class="mdui-btn mdui-btn-raised mdui-color-green">Download</button>
      <button onclick="mv('tab2')"  class="mdui-btn mdui-btn-raised mdui-color-green">Move to Tab2</button>
    <button onclick="cp('tab2')"  class="mdui-btn mdui-btn-raised mdui-color-green">Copy to Tab2</button>
</div>
  <div id="tab1main"  ></div>
</div>
<div id="tab2" class="mdui-p-a-2">
<div  class="mdui-textfield">
<input id="tab2path" class="mdui-textfield-input" type="text" placeholder="Path"/>
  <button onclick="myenter('tab2')" class="mdui-btn mdui-btn-raised mdui-color-green">Enter/Refresh</button>
   <button mdui-dialog="{target: '#mkdirr'}" class="mdui-btn mdui-btn-raised mdui-color-green">New Folder</button>
   <button mdui-dialog="{target: '#delalert'}"  class="mdui-btn mdui-btn-raised mdui-color-green">Remove</button>
    <button onclick="download()"  class="mdui-btn mdui-btn-raised mdui-color-green">Download</button>
    <button onclick="mv('tab1')"  class="mdui-btn mdui-btn-raised mdui-color-green">Move to Tab1</button>
    <button onclick="cp('tab1')"  class="mdui-btn mdui-btn-raised mdui-color-green">Copy to Tab1</button>
</div>
<div id="tab2main"  ></div>
</div>
<script>
selectvar = []
selectvarf = []
active = 'tab1'
document.getElementById('tab1' + 'path').value = '/home'
document.getElementById('tab2' + 'path').value = '/home'
function myenter(id) {
value = document.getElementById(id + 'path').value
m = document.getElementById(id + 'main')
let xhr= new XMLHttpRequest();
xhr.open('GET', "ls.sh?" + value, true);
xhr.send();
xhr.onreadystatechange = function() {
if (xhr.readyState === 4 && xhr.status === 200) {
m.innerHTML =  xhr.responseText
}
}
}

</script>
<script>
function enter(path) {
document.getElementById(active + 'path').value = path
myenter(active)
}
function myselectfile(path) {
path2 = path.toString()
if(document.getElementById(path).checked == true) {
selectvarf.push(path2)
}
if(document.getElementById(path).checked == false) {
selectvarf.removeByValue(path2);
}
}
function myselectdir(path) {
path2 = path.toString()
if(document.getElementById(path).checked == true) {
selectvar.push(path2)
}
if(document.getElementById(path).checked == false) {
selectvar.removeByValue(path2);
}
}
function mkdir() {
name = document.getElementById('fname').value
path = document.getElementById(active + 'path').value
let xhr= new XMLHttpRequest();
xhr.open('GET', "mkdir.sh?" + path + '/' + name, true);
xhr.send();
enter(path + '/' + name)
}
function myselect(path) {
path2 = path.toString()
if(document.getElementById(path).checked == true) {
selectvar.push(path2)
}
if(document.getElementById(path).checked == false) {
selectvar.removeByValue(path2);
}
}
async function rm() {
await rm2()
mybar('OK');
}

function download() {
i = 0
while(selectvarf[i]) {
var a = document.getElementById('down')
var b = selectvarf[i]
var b = b.split('/')
var c = b.length -1
a.download = b[c]
a.href = 'download.sh?' + selectvarf[i]
console.log(a)
a.click()
i++
console.log(selectvarf[i])
}
}

function rm2() {
i = 0
while(selectvar[i]) {
console.log(selectvar[i])
let xhr= new XMLHttpRequest();
xhr.open('GET', "rm.sh?" + selectvar[i], true);
xhr.send();
i++
}
i=0
while(selectvarf[i]) {
console.log(selectvar[i])
let xhr= new XMLHttpRequest();
xhr.open('GET', "rm.sh?" + selectvarf[i], true);
xhr.send();
i++
}
}

function mybar(content) {
mdui.snackbar({
  message: content,
  timeout: 400
});
}
Array.prototype.removeByValue = function (val) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] === val) {
      this.splice(i, 1);
      i--;
    }
  }
  return this;
}

async function mv(tab) {
await mv2(tab)
mybar('OK');
}

async function cp(tab) {
await cp2(tab)
mybar('OK');
}


function mv2(tab){
des = document.getElementById(tab + 'path').value
i = 0
while(selectvar[i]) {
let xhr= new XMLHttpRequest();
xhr.open('GET', "mv.sh?" + selectvar[i] + '&' + des, true);
xhr.send();
i++
}
i = 0
while(selectvarf[i]) {
console.log(selectvarf[i])
let xhr= new XMLHttpRequest();
xhr.open('GET', "mv.sh?" + selectvarf[i] + '&' + des, true);
xhr.send();
i++
}
}

function cp2(tab){
des = document.getElementById(tab + 'path').value
i = 0
while(selectvar[i]) {
let xhr= new XMLHttpRequest();
xhr.open('GET', "cp.sh?" + selectvar[i] + '&' + des, true);
xhr.send();
i++
}
i = 0
while(selectvarf[i]) {
console.log(selectvarf[i])
let xhr= new XMLHttpRequest();
xhr.open('GET', "cp.sh?" + selectvarf[i] + '&' + des, true);
xhr.send();
i++
}
}
function xopen(path) {
let xhr= new XMLHttpRequest();
xhr.open('GET', "xopen.sh?" + path, true);
xhr.send();
}
</script>
EOF
bash tail.sh
