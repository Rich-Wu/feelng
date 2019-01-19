var menu_content = document.getElementById('menu-content');
var menu_container = document.getElementsByClassName('menu-container')[0];
var about_overlay = document.getElementById('overlay1');


// DISPLAY POPUP BOX
function popUp(){
 var userConfirm = confirm("Welcome to Feelng!\nConnect to Spotify now for playback music? Connect later by selecting '\ Connect with Spotify\ ' in the dropdown menu.");  
}

// DISPLAYS MENU CONTENT
function openMenu() {
  menu_content.classList.toggle('drop');
}

// DISPLAY OVERLAY
function openOverlay1() {
  about_overlay.style.height = "100%";
  menu_container.style.display = "none";
}

// CLOSES OVERLAY
function closeOverlay1() {
  about_overlay.style.height = "0";
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
