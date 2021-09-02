import { Controller } from "stimulus"
import Calendar from 'color-calendar';
import 'color-calendar/dist/css/theme-basic.css';
import 'color-calendar/dist/css/theme-glass.css';
import "controllers"

export default class extends Controller {

  static targets = ['date'];
  append() {
    let dateInput = document.querySelector('#booking_dates');
    if (dateInput.value) {
      dateInput.value = `${dateInput.value}, ${this.dateTarget.dataset.date}`
    } else {
      dateInput.value = this.dateTarget.dataset.date
    }
  }
}
