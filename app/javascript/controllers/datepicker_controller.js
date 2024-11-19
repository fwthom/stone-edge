import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";

export default class extends Controller {

  static targets = ["dateForm", "start", "end"]

  connect() {
    console.log(this.element)
    // flatpickr(this.element)
    const bookingForm = this.dateFormTarget
    if (bookingForm) {
      const bookings = JSON.parse(bookingForm.dataset.bookings);
      flatpickr(this.startTarget, {
        plugins: [new rangePlugin({ input: this.endTarget})],
        minDate: "today",
        inline: true,
        dateFormat: "Y-m-d",
        "disable": bookings,
      })
    }
  }
};
