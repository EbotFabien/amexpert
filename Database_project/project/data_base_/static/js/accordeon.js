<<<<<<< HEAD

=======
>>>>>>> c6c4135ede4e808be5c4f7b824a3d3f819d4c77e
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
<<<<<<< HEAD
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
=======
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}
>>>>>>> c6c4135ede4e808be5c4f7b824a3d3f819d4c77e
