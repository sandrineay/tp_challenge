const toggleTableHeader = () => {
  let scrollPos = 0;
  const tableHeader = document.getElementById('table-header');
  function checkPosition() {
    let windowY = window.scrollY;
    if (windowY > 418) {
      tableHeader.classList.remove('hidden');
    } else {
      tableHeader.classList.add('hidden');
    }
  }

  window.addEventListener('scroll', checkPosition);
  window.addEventListener('click', () => {console.log(window.scrollY)})
}

export { toggleTableHeader }
