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

      let selectedDate = {};
      const onClick = (e) => {
        let day;
        let dateSplit = String(e).split(' ').slice(0,4);
        let date = new Date(dateSplit);
        day = (dateSplit[2][0] === "0" ? dateSplit[2][1] : dateSplit);
        if (date in selectedDate) {
          selectedDate[date].selected = !selectedDate[date].selected;
        } else {
          selectedDate[date] = { selected: true, day: day };
        }
        let selectedDateElement= document.querySelectorAll('.calendar__day.calendar__day-active.calendar__day-event');
        for (const [key, value] of Object.entries(selectedDate)) {
          console.log(`${key}: ${value.selected}, day: ${value.day}`);
          for (const element of selectedDateElement) { 
            if (element.innerText === value.day && value.selected) {
              element.classList.add('calendar__day-selected-date');
            } else {
              element.classList.remove('calendar__day-selected-date');
            }
          }
        }
      }

      new Calendar({
        id: '#color-calendar',
        eventsData: myEvents,
        selectedDateClicked: onClick,
        disableMonthArrowClick: true,
        dateChanged: (date, e) => {
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
