
const calendar = document.getElementById("all-calendar")

if (calendar) {
  const calendarDays = document.querySelectorAll(".calendar-day-view");
  const taskDays = Array.from(document.querySelectorAll(".details-day-calendar"));

  calendarDays.forEach((calendarDay) => {
    calendarDay.addEventListener("click", (event) => {
      const matchingTask = taskDays.find(taskDay => calendarDay.getAttribute("date") === taskDay.getAttribute("date"));

      // On regarde les classes et en fonction on display ou non
      if (matchingTask.classList.contains("d-none")) {
        // Toutes les daskDay qui sont affichées
        const displayTasks = taskDays.filter(taskDay => !taskDay.classList.contains("d-none"));

        // On les cache
        displayTasks.forEach(task => task.classList.add("d-none"))

        // On affiche la matchin task
        matchingTask.classList.remove("d-none");
      } else {
        matchingTask.classList.add("d-none");
      }
    })
  })

  const descriptionTaskCalendar = document.querySelectorAll(".description-task-calendar");
  const taskTitles = document.querySelectorAll(".title-task");

  taskTitles.forEach((taskTitle)=> {
    taskTitle.addEventListener("click", (event) => {
    descriptionTaskCalendar.forEach(description => {
      description.forEach(d => {
        d.classList.toggle("d-none");
      })
    }
  )});
  });
}





