import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(".datepickr", {});
    flatpickr(".timepickr", {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
  });
  }
}
