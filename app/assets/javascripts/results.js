window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
    header = document.getElementById('header');
    header.firstElementChild.style.opacity = "0";
    header.lastElementChild.style.opacity = "0";
  } else {
    header.firstElementChild.style.opacity = "1";
    header.lastElementChild.style.opacity = "1";
  }
}

// function openForm() {
//   document.getElementById("myForm").style.display = "block";
// }
//
// function closeForm() {
//   document.getElementById("myForm").style.display = "none";
// }
