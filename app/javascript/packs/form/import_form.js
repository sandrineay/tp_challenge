const activateButton = () => {
  const fileSelector = document.getElementById('file');
  fileSelector.addEventListener('change', () => {
    document.getElementById('submit-file').disabled = false;
  })
}

export { activateButton };
