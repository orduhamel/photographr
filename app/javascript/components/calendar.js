const calendar = document.getElementById("all-calendar");

if (calendar) {
  const calendarDays = document.querySelectorAll(".calendar-day-view");
  const taskDays = Array.from(document.querySelectorAll(".details-day-calendar"));
  const todayMessage = document.getElementById("today-message");

  calendarDays.forEach((calendarDay) => {
    calendarDay.addEventListener("click", (event) => {
      const matchingTask = taskDays.find(taskDay => calendarDay.getAttribute("date") === taskDay.getAttribute("date"));
      // On regarde les classes et en fonction on display ou non
      console.log(matchingTask);
      const dayTasks = document.querySelectorAll(".pink-actif-calendar");
      const dayTasksToday = document.querySelectorAll(".green-actif-calendar");

      dayTasksToday.forEach((today)=> {
        today.classList.remove("green-actif-calendar");
      })

      dayTasks.forEach((dayTask)=>{
        dayTask.classList.remove("pink-actif-calendar");
      })

      const today = document.querySelector(".today")
      const dayTask = calendarDay.querySelector(".day-task");
      if (dayTask) {
        dayTask.classList.add("pink-actif-calendar");
      } else {
        today.classList.add("green-actif-calendar");
      }

      if (matchingTask.classList.contains("d-none")) {
        // Toutes les daskDay qui sont affichées
        const displayTasks = taskDays.filter(taskDay => !taskDay.classList.contains("d-none"));

        // On les cache
        displayTasks.forEach(task => task.classList.add("d-none"));

        matchingTask.classList.remove("d-none");

        // todayMessage.classList.add("d-none");


        // ----------- SUB TASKS ---------

        const matchingSubTasks = matchingTask.querySelectorAll(".task-per-day");

        matchingSubTasks.forEach((matchingSubTask) => {
          const title = matchingSubTask.querySelector(".title-task");
          const description = matchingSubTask.querySelector(".description-task-calendar");
          const titlePrestation = matchingSubTask.querySelector(".task-prestation-title-calendar")

          title.addEventListener("click", (event) => {
            description.classList.toggle("d-none");
            title.classList.toggle("pink-actif");
            titlePrestation.classList.toggle("pink-actif");
            matchingSubTask.classList.toggle("gray-actif");
          })
        })
      } else {
        matchingTask.classList.add("d-none");

        // todayMessage.classList.remove("d-none");
      }
    });
  });
}

