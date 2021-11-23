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
import { initSweetalert } from '../plugins/init_sweetalert';
import { speciesSelector } from '../plugins/species_selector';



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "https://i.gifer.com/4eRC.gif"
});

initSweetalert('#sweet-alert-slap', {
  title: "Are you sure?",
  text: "Your pingochi just got a slap!",
  icon: "https://i.gifer.com/3U60.gif",
  dangerMode: true,
  buttons: true
}, (value) => {
  if (value) {
    const link = document.querySelector('#slap-action');
    link.click();
  }
});

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  speciesSelector();
});
