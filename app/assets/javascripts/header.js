function toggleNotification() {
  const dropDown = document.querySelector(".dropdown");
  dropDown.classList.toggle("dropdown-visible");
  
  const menu = document.getElementsByClassName("dropdown_menu")[0];
    if (menu) {
      menu.classList.toggle("visible");
    }
}

function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
      x.className += " responsive";
  } else {
      x.className = "topnav";
  }
} 