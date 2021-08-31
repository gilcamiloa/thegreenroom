import { Controller } from "stimulus"
import Calendar from 'color-calendar';
import 'color-calendar/dist/css/theme-basic.css';
import 'color-calendar/dist/css/theme-glass.css';
import "controllers"

export default class extends Controller {

  connect() {
    const dates = JSON.parse(this.data.get('available_dates'));
    document.addEventListener('turbolinks:load', () => {
      const myEvents = dates.map(date => ({
        start: date,
        end: date
       })) 

      const sayHello = (e) => {
        // console.log(e);
      }

      new Calendar({
        id: '#color-calendar',
        eventsData: myEvents,
        selectedDateClicked: sayHello,
        dateChanged: (date, e) => {
          console.log(e)
        // do something
      }
      })

      let calendar_dates= document.querySelectorAll('.calendar__day.calendar__day-active');
      calendar_dates.forEach(date => {
        if (date.classList.contains('calendar__day-event')) { 
          return;
        } else if (date.classList.contains('calendar__day-selected')) {
          date.classList.remove('calendar__day-selected');
          date.classList.remove('calendar__day-today');
          date.classList.remove('calendar__day-no-event');
        }
        date.style.pointerEvents = "none";
        date.classList.add('calendar__day-other');
        date.innerHTML = date.innerText;
      });
    });

  }
}
