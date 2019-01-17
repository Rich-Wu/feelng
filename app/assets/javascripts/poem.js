function expand() {
  console.log('Clicked');
  poem = document.getElementById('poem');
  if (poem.style.height == '20vh') {
    poem.style.height = '60vh';
  } else {
    poem.style.height = '20vh';
  }
}
