manageMenuOpen()
manageMenuClose()

function manageMenuClose() {
  var button = document.getElementById("closeMenuButton");
  if (button) {
    button.addEventListener("click", closeMenu);
  }
}

function manageMenuOpen() {
  var button = document.getElementById("openMenuButton");
  if (button) {
    button.addEventListener("click", openMenu);
  }
}

function closeMenu() {
  var menu = document.getElementById("menu");
  if (menu) {
    menu.classList.remove("active");
  }
}

function openMenu() {
  var menu = document.getElementById("menu");
  if (menu) {
    menu.classList.add("active");
  }
}