<!--
// please keep these lines on when you copy the source
// made by: Nicolas - http://www.javascript-page.com
 
var currentdate = 0
var core = 0
 
function StringArray (n) {
  this.length = n;
  for (var i =1; i <= n; i++) {
    this[i] = ' '
 
  }
}
 
image = new StringArray(8)
image[0] = 'images/header/home-header00.jpg'
image[1] = 'images/header/home-header01.jpg'
image[2] = 'images/header/home-header02.jpg'
 
 
var ran = 60/image.length
 
function ranimage() {
  currentdate = new Date()
  core = currentdate.getSeconds()
  core = Math.floor(core/ran)
    return(image[core])
}
document.write("+ranimage()+")
