const checkNewClient = document.getElementById("check-new-client");
// console.log(checkNewClient)

const existingClient = document.querySelector(".existing-client");
const newClient = document.querySelector(".new-client");

checkNewClient.addEventListener("click", (event) => {
  existingClient.classList.toggle("d-none");
  newClient.classList.toggle("d-none");
});

