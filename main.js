selectvar = []
document.getElementById('newtab').href = window.location.href
document.getElementById('method').innerHTML =  window.localStorage.getItem('method')
Array.prototype.removeByValue = function (val) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] === val) {
      this.splice(i, 1);
      i--;
    }
  }
  return this;
}
function mymethod(method) {
    document.getElementById('method').innerHTML = method
    window.localStorage.setItem('method', method)
}
function mybar(content) {
mdui.snackbar({
  message: content,
  timeout: 5000,
  position: 'right-top'
});
}
function myreload() {
  document.getElementById('fname').value = ''
  document.getElementById('touchname').value = ''
  var xhr= new XMLHttpRequest();
  path = document.getElementById('path').value
  console.log(path)
  xhr.open('GET', "ls.sh?" + path , true);
  xhr.send();
  xhr.onreadystatechange = function() {
  if (xhr.readyState === 4){
      if (xhr.status === 200){
         document.getElementById('mymain').innerHTML = xhr.responseText
      }
    }
  }
}
function myrequest(url) {
  var xhr= new XMLHttpRequest();
  xhr.open('GET', url , true);
  xhr.send();
  xhr.onreadystatechange = function() {
  if (xhr.readyState === 4){
      if (xhr.status === 200){
         myreload()
      } else {
        mybar("failed")
        myreload()
      }
    }
  }
}
function myselect(path) {
  if(document.getElementById(path).checked == true) {
    selectvar.push(path)
  }
  if(document.getElementById(path).checked == false) {
    selectvar.removeByValue(path);
  }
}
function enter(path) {
  path = document.getElementById('path').value
  var enter = document.getElementById("enter")
  enter.href = "index.sh?" + path
  enter.click()
}
function mkdir() {
  name = document.getElementById('fname').value
  path = document.getElementById('path').value
  document.getElementById('progress').style.display = 'block'
  myrequest("mkdir.sh?" + path + '/' + name)
}
function touch() {
  name = document.getElementById('touchname').value
  path = document.getElementById('path').value
  document.getElementById('progress').style.display = 'block'
  myrequest("touch.sh?" + path + '/' + name)
}

function rm() {
  document.getElementById('progress').style.display = 'block'
  myrequest("rm.sh")
}

function xopen(path) {
  method = window.localStorage.getItem('method')
  console.log(method)
  if(method == 'Local') {
      myrequest("xopen.sh?" + path);
  }
  if(method == 'Download') {
      var a = document.getElementById('down')
      var tmp = path.split('/')
      var tmp2 = tmp.length -1
      a.download = tmp[tmp2]
      a.href = 'download.sh?' +     path
      a.click()
  }
    if(method == 'Browser') {
      var a = document.getElementById('open')
      a.href = 'download.sh?' +     path
      a.click()
  }
}
function mypushselect() {
  mybar('Selected.Now you can remove your files or copy/move files to another tab.')
  i = 0
  var xhr= new XMLHttpRequest()
  xhr.open('GET', "newselect.sh?", true)
  xhr.send();
  xhr.onreadystatechange = function() {
  if (xhr.readyState === 4){
      if (xhr.status === 200){
         while(selectvar[i]) {
         myrequest("addselect.sh?" + selectvar[i])
         i++
         }
      }
    }
  }
}
function cp() {
  document.getElementById('progress').style.display = 'block'
  path = document.getElementById('path').value
  myrequest("cp.sh?" + path)
}
function mv() {
  document.getElementById('progress').style.display = 'block'
  path = document.getElementById('path').value
  myrequest("mv.sh?" + path)
}
function myselectall() {
  var allcheckbox = document.querySelectorAll('input[type=checkbox]');
  var i = 0
  while(allcheckbox[i]) {
    allcheckbox[i].click()
    i++
    }
}
async function myupload() {
  await localStorage.clear()
  await localStorage.setItem('path', document.getElementById('path').value)
  document.getElementById('upload').click()
}
