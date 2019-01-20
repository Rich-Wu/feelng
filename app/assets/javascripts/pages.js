var menu_content = document.getElementById('menu-content');
var menu_container = document.getElementsByClassName('menu-container')[0];
var about_overlay = document.getElementById('overlay1');
document.get

// DISPLAY POPUP BOX
// function popUp(){
//  var userConfirm = confirm("Welcome to Feelng!\nWould you like to connect to Spotify for playback music? You can always connect later by selecting '\Connect With Spotify\' in the dropdown menu.");
//    if (userConfirm == true) {
//     menu_content.classList.toggle('drop');
//     localStorage.setItem(userConfirm);
//   }
// }
// window.onload = popUp;

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
