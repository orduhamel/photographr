const showPrestation = document.getElementById("show-prestation")

if (showPrestation) {
  const cardsTask = document.querySelectorAll(".card-task");

  cardsTask.forEach((cardTask) => {
    const descriptionTask = cardTask.querySelector(".task-description-show");

    cardTask.addEventListener("click", (event) => {
      descriptionTask.classList.toggle("d-none");
    })
  })
};
