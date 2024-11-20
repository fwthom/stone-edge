import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {
  static targets = ["startDate", "endDate", "price", "priceShow"]
  static values = { 
    startDate: String,
    endDate: String,
    price: String,
  }


  connect() {
    if (this.startDateValue && this.endDateValue) 
      {
        this.startDateTarget.value = this.startDateValue;
          this.endDateTarget.value = this.endDateValue;
          const date1 = new Date(this.startDateValue);
          const date2 = new Date(this.endDateValue);
          const priceString = this.priceValue;
          const duration = Math.floor((date2 - date1) / (1000 * 60 * 60 * 24));
          const price = parseFloat(priceString);
          const totalPrice = duration * price;
          this.priceShowTarget.innerText = `Le prix de la location est de ${totalPrice.toFixed(2)} €`
        }
  }


  updatePrice() {

    if (this.startDateTarget.value && this.endDateTarget.value) {
      const duration = this.computeDuration();
      const priceString = this.priceValue;
      const price = parseFloat(priceString);
      const totalPrice = duration * price;
      this.priceShowTarget.innerText = `Le prix de la location est de ${totalPrice.toFixed(2)} €`
    }
    else {
      this.priceShowTarget.innerText = `Saisir deux dates pour calculer le prix`
    }
  }

  computeDuration() {
    const diffTime = (Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value))
    if (diffTime === 0) {
      return 1
    }
    else {
      return Math.floor((diffTime) / (1000 * 60 * 60 * 24))
    }
  }
}