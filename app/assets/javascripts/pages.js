var menu_content = document.getElementById('menu-content');
var home_overlay = document.getElementById('overlay');
var menu_container = document.getElementsByClassName('menu-container')[0];

// DISPLAYS MENU CONTENT
function openMenu() {
  menu_content.classList.toggle('drop');
}

// DISPLAYS OVERLAY
function openOverlay() {
  home_overlay.style.height = "100%";
  menu_container.style.display = "none";
}

// CLOSES OVERLAY
function closeOverlay() {
  home_overlay.style.height = "0";
  setTimeout(function() {
    menu_container.style.display = "block";
  }, 500);
}

// CLOSES MENU CONTENT
window.onclick = function(event) {
  if (!event.target.matches('.menu-container'))
    menu_content.classList.remove('drop');
}
