const showPrestation = document.getElementById("show-prestation")

if (showPrestation) {
  const cardsTask = document.querySelectorAll(".card-task");

  cardsTask.forEach((cardTask) => {
    const descriptionTask = cardTask.querySelector(".task-description-show");
    const dateTask = cardTask.querySelector(".task-prestation-client");
    const nameTask = cardTask.querySelector(".text-truncate");


    cardTask.addEventListener("click", (event) => {
      descriptionTask.classList.toggle("d-none");
      cardTask.classList.toggle("white-actif");
      dateTask.classList.toggle("pink-actif");
      nameTask.classList.toggle("pink-actif");
    })
  })
};
