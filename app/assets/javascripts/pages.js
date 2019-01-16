var menu_content = document.getElementById('menu-content');
var menu_container = document.getElementsByClassName('menu-container')[0];
var about_overlay = document.getElementById('overlay1');
var login_overlay = document.getElementById('overlay2');
var signup_overlay = document.getElementById('overlay3');


// DISPLAYS MENU CONTENT
function openMenu() {
  menu_content.classList.toggle('drop');
}

// DISPLAYS ARRAY OF OVERLAYS
function openOverlay1() {
  about_overlay.style.height = "100%";
  menu_container.style.display = "none";
}

function openOverlay2() {
  login_overlay.style.height = "100%";
  menu_container.style.display = "none";
}

function openOverlay3() {
  signup_overlay.style.height = "100%";
  menu_container.style.display = "none";
}

// CLOSES ARRAY OF OVERLAYS
function closeOverlay1() {
  about_overlay.style.height = "0";
  setTimeout(function() {
    menu_container.style.display = "block";
  }, 500);
}

function closeOverlay2() {
  login_overlay.style.height = "0";
  setTimeout(function() {
    menu_container.style.display = "block";
  }, 500);
}

function closeOverlay3() {
  signup_overlay.style.height = "0";
  setTimeout(function() {
    menu_container.style.display = "block";
  }, 500);
}

// CLOSES MENU CONTENT
// window.addEventListener('click', myFunction);
// function myFunction() {
//   if (menu_content.classList.contains('drop')) {
//     menu_content.classList.remove('drop');
//     console.log('testing');
//   }
// }

// window.onclick = function(event) {
//   if (!event.target.matches('.menu-container')) {
//     var menu_content = document.getElementsByClassName('menu-dropdown')[0];
//     console.log(menu_content.length);
//     var i;
//     for (i = 0; i < menu_content.length; i++) {
//       var openDropdown = menu_content[i];
//       if (openDropdown.classList.contains('drop')) {
//         openDropdown.classList.remove('drop');
//         console.log('testing');
//       }
//     }
//   }
// }
