import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  static targets = ["startDate", "endDate", "price"]
  static values = { 
    startDate: String,
    endDate: String,
    price: String,
  }


  connect() {

    console.log(this.priceValue);
    
    this.startDateTarget.value = this.startDateValue;
    this.endDateTarget.value = this.endDateValue;

    const dateString1 = this.startDateValue;
    const date1 = new Date(dateString1);
    const dateString2 = this.endDateValue;
    const date2 = new Date(dateString2);

    const duration = Math.floor((date2 - date1) / (1000 * 60 * 60 * 24));
    const totalPrice = duration * this.priceValue;

    console.log(totalPrice);
    
  }
}
