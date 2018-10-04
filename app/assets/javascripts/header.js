function toggleNotification() {
  const dropDown = document.querySelector(".dropdown");
  dropDown.classList.toggle("dropdown-visible");
  
  const menu = document.getElementsByClassName("dropdown_menu")[0];
    if (menu) {
      menu.classList.toggle("visible");
    }
}