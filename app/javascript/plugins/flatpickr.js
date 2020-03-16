import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
require("flatpickr/dist/themes/material_green.css");

const newPrestation = document.getElementById("new-prestation");

if (newPrestation) {

flatpickr("#datepicker", {
  // altInput: true,
  // altFormat: "F j, Y",
  // dateFormat: "d-m-Y",
  dateFormat: "d/m/Y",
  plugins: [new rangePlugin({ input: ".end_date"})]
});

const startDate = document.getElementById("datepicker");
const endDate = document.querySelector(".end_date");
const rangeDates = document.getElementById("range-dates");
const datesDiv = document.querySelector(".dates-div");
const startDateDiv = document.querySelector(".start-date");

startDate.addEventListener('input', (event) => {
  startDateDiv.classList.add("d-none");
  datesDiv.classList.remove("d-none");
    if (endDate.value === startDate.value) {
    rangeDates.value = startDate.value;
  } else {
    rangeDates.value = 'Du '+ startDate.value + ' au ' + endDate.value;
  }
});
};
