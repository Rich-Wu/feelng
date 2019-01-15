var menu_content = document.getElementById('menu-content');

// DISPLAYS MENU CONTENT
function openMenu() {
  menu_content.classList.toggle('drop');
}

// CLOSES MENU CONTENT
// window.onclick = function(event) {
//   if (!event.target.matches('.menu-container'))
//     menu_content.classList.remove('drop');
// }
