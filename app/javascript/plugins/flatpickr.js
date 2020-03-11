import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#datepicker", {
  // altInput: true,
  // altFormat: "F j, Y",
  // dateFormat: "d-m-Y",
  dateFormat: "d/m/Y",
  plugins: [new rangePlugin({ input: ".end_date"})]
});
