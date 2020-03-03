const openPage = () => {
  const tablinks = document.querySelectorAll(".tablinks");
  tablinks.forEach((link) => {
    link.addEventListener('click', (event) => {
    tablinks.forEach(tabLink => tabLink.classList.remove('active'));
      event.currentTarget.classList.add('active');
      const container = document.getElementById(event.currentTarget.dataset.id);
      const containers = document.querySelectorAll('.tabcontent');
      containers.forEach(c => c.classList.add('d-none'));
      container.classList.remove('d-none');
    });
  });
};

export { openPage };
