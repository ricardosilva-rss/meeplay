// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'select2/dist/css/select2.min.css';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
// import "feedback"


// buttons //
var btn = document.querySelectorAll('.material');
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
// buttons end //
