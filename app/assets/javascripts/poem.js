function expand() {
  console.log('Clicked');
  poem = document.getElementById('poem');
  if (poem.style.height == '20vh') {
    poem.style.height = '100%';
  } else {
    poem.style.height = '20vh';
  }
}
