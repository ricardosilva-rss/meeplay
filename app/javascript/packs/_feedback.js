var btn = document.querySelectorAll('.a_btn');
btn.forEach(el => {
  el.style.position = 'relative';
  el.style.overflow = 'hidden';
  el.addEventListener('click', function(e) {
    var x = e.offsetX;
    var y = e.offsetY;

    var ripples = document.getElementsByClassName('ripple');

    if (ripples.length < 10) { // this restricts the user from creating lots of ripples
      var ripple = document.createElement('span');
      ripple.classList.add('ripple');
      ripple.style.left = x+'px';
      ripple.style.top = y+'px';
      this.appendChild(ripple);

      setTimeout(function() {
        ripple.remove();
      }, 1000);
    }
  });
})
