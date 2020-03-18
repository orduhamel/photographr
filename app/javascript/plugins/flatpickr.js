import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
require("flatpickr/dist/themes/material_green.css");

const newPrestation = document.querySelector(".prestation-form");

if (newPrestation) {

flatpickr(".datepicker", {
  // altInput: true,
  // altFormat: "F j, Y",
  // dateFormat: "d-m-Y",
  // dateFormat: "d m Y",
  plugins: [new rangePlugin({ input: "#end_date"})],
  allowInput: true
});

const startDate = document.querySelector(".datepicker");
const endDate = document.querySelector(".end_date");
const rangeDates = document.getElementById("range-dates");
const datesDiv = document.querySelector(".dates-div");
const startDateDiv = document.querySelector(".start-date");
const endDateDiv = document.querySelector(".end-date");

startDate.addEventListener('input', (event) => {
  startDateDiv.classList.add("d-none");
  endDateDiv.classList.add("d-none");
  datesDiv.classList.remove("d-none");
    if (endDate.value === startDate.value) {
    rangeDates.value = startDate.value;
  } else {
    rangeDates.value = 'Du '+ startDate.value + ' au ' + endDate.value;
  }
});

datesDiv.addEventListener('click', (event) => {
  datesDiv.classList.add("d-none");
  startDateDiv.classList.remove("d-none");
  endDateDiv.classList.remove("d-none");
});

};

const editTask = document.querySelector(".task-form");

if (editTask) {

  const startDate = flatpickr(".datepicker", {
    dateFormat: "d-m-Y"
  });

  const endDate = flatpickr(".end_date", {
    dateFormat: "d-m-Y",
    minDate: startDate.selectedDates[0]
  });

}
