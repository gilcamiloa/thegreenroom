// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "controllers"
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  const markers = document.querySelectorAll('.mapboxgl-marker');
  if (document.querySelectorAll('.calendar-heading')) {
    const prev = document.querySelectorAll('.calendar-heading a')[0]
    prev.innerText = '<'
    const next = document.querySelectorAll('.calendar-heading a')[1]
    next.innerText = '>'
  }
  markers.forEach((marker) => {
    marker.addEventListener('click', () => {
      const id = marker.dataset.id
      const card = document.getElementById(`venue${id}`)
      setTimeout(() => {
        card.scrollIntoView({ behavior: 'smooth', block: 'center' })
      })
    });
  });
})
