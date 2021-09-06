import { Controller } from "stimulus"
import Calendar from 'color-calendar';
import 'color-calendar/dist/css/theme-basic.css';
import 'color-calendar/dist/css/theme-glass.css';
import "controllers"

export default class extends Controller {

  static targets = ['date', 'date_booked'];
  static values = {foo: Array}
  connect(){
    this.date_bookedTarget.parentElement.parentElement.style.backgroundColor = 'green';
  }
  append() {
    const b = this.dateTarget;
    if (b.parentElement.parentElement.style.backgroundColor) {
      b.parentElement.parentElement.style.backgroundColor = ''
    } else {
      b.parentElement.parentElement.style.backgroundColor = '#b5e48c'
    }
    let dateInput = document.querySelector('#booking_dates');
    if (dateInput == null) {
      dateInput = document.querySelector('#venue_available_dates')
    }
    if (dateInput) {
      if (dateInput.value) {
        let dateArray = dateInput.value.split(',')
        const index = dateArray.indexOf(this.dateTarget.dataset.date);
        if (index > -1) {
          dateArray.splice(index, 1);
        } else {
          dateArray = [...dateArray, this.dateTarget.dataset.date]
        }
        dateInput.value = String(dateArray)
      } else {
        dateInput.value = this.dateTarget.dataset.date
      }
    }
    console.log(dateInput.value)
  }
}
