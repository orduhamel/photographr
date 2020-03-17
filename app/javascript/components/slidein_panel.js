// Selectionner tout le dashboard
const dashboard = document.getElementById("dashboard");

if (dashboard) {
  const cardsTask = document.querySelectorAll(".card-task");

  cardsTask.forEach((cardTask) => {
    // Selectionner la zone de click pour faire apparaître Task#Show (=nom de la tache)
    const taskName = cardTask.querySelector(".task-name");

    // Selectionner la zone de click pour faire disparraître Task#Show (= bouton close de Task#Show)
    const taskClose = cardTask.querySelector('.close');

    // Selectionner l'objet sur lequel ajouter et supprimer la classe .cd-panel--is-visible
    const taskShow = cardTask.querySelector('.js-cd-panel-main');

    // Au click sur taskName, rendre le panel visible : ajouter la classe .cd-panel--is-visible
    taskName.addEventListener("click", (event) => {
      taskShow.classList.add("cd-panel--is-visible");
    })

    // Au click sur taskClose, cacher le panel : supprimer la classe .cd-panel--is-visible
    taskClose.addEventListener("click", (event) => {
      taskShow.classList.remove("cd-panel--is-visible");
    })
  })
};



