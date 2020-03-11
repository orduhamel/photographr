const toggleButton = document.getElementById("toggle-button");

const sidebar = document.querySelector(".sidebar-toggle")

toggleButton.addEventListener("click", (event) => {
  sidebar.classList.toggle("hide-sidebar");
});

