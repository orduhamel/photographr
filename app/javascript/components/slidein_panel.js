// Selectionner tout le dashboard
const dashboard = document.getElementById("dashboard");

if (dashboard) {
  // Selectionner toutes les taches
  const cardsTask = document.querySelectorAll(".card-task");

  cardsTask.forEach((cardTask) => {
    // Selectionner l'objet sur lequel cliquer pour faire apparaître une tache
    const taskName = cardTask.querySelector(".task-name");

    // Selectionner l'objet sur lequel cliquer pour faire disparaître une tache
    const taskClose = cardTask.querySelector('.close');

    // Selectionner la tache à faire apparaitre ou disparaitre
    const taskShow = cardTask.querySelector('.js-cd-panel-main');

    // Au click sur taskName, rendre la tache visible
    taskName.addEventListener("click", (event) => {
      // Selectionner toutes les taches visibles et les faire disparaitre
      const tasksShow = Array.from(document.querySelectorAll('.cd-panel'));
      const displayedTasks = tasksShow.filter(task => task.classList.contains("cd-panel--is-visible"));
      displayedTasks.forEach(task => task.classList.remove("cd-panel--is-visible"));
      // Afficher la nouvelle tache sur laquelle on a cliqué
      taskShow.classList.add("cd-panel--is-visible");
    })

    // Au click sur le bouton 'Modifier'
    // Afficher le formulaire pour éditer la tâche
    const modifyTask = cardTask.querySelector(".modify");
    const editTask = cardTask.querySelector(".task-form");
    modifyTask.addEventListener("click", (event) => {
      editTask.classList.remove("d-none");
      modifyTask.classList.add("d-none");
    })



    // Au click sur taskClose, cacher la tache
    taskClose.addEventListener("click", (event) => {
      taskShow.classList.remove("cd-panel--is-visible");
    })
  })

  // const slidein = document.querySelector(".cd-panel__container");

  // if (slidein) {
  // }
};

// 1) Si aucune tache n'est visible :
// Afficher la tache sur laquelle on a cliqué AVEC un effet de transition => OK

// 2) Si une tache est deja visible et qu'on veut en ouvrir une autre :
// - Afficher la nouvelle tache sur laquelle on a cliqué
// - Faire disparaitre l'ancienne tache

// 3) Si une tache est visible et qu'on veut la faire disparaitre sans en afficher une nouvelle :
// Cliquer sur le bouton close de la tache pour la faire disparaitre => OK

