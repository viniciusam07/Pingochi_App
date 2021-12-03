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
import "controllers";
import { initSweetalert } from '../plugins/init_sweetalert';
import { speciesSelector } from '../plugins/species_selector';
import fight from './fight';
import love from './love';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log("Aqui deu bom")
  speciesSelector();
  fight();
  love();

  initSweetalert('#sweet-alert-slap', {
    title: "Are you sure?",
    text: "A slap drains 10 energy units!",
    icon: "https://media.giphy.com/media/vJhJq3SISV8jK/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#slap-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-fish', {
    title: "Let's fish coins?",
    text: "Your Pingochi will mine fishcoins on Ethereum chain",
    icon: "https://media.giphy.com/media/8jOKTmCzr3zYQ/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#fish-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-feed', {
    title: "Let's eat something?",
    text: "Your pingochi will gain 20 energy units",
    icon: "https://media.giphy.com/media/Ve5J6fIqJ4TFmz6Ene/giphy-downsized-large.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#feed-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-sleep', {
    title: "Nap time!",
    text: "Your Pingochi will recovery all energy",
    icon: "https://media.giphy.com/media/Aot7IKh3ogALK/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#sleep-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-speed', {
    title: "Hey Ho! Let's Go!",
    text: "Your pingochi will increase the speed skill",
    icon: "https://media.giphy.com/media/exy8Jayw1Ud8c/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#speed-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-strength', {
    title: "No pain, no gain!",
    text: "Your pingochi will increase the strength skill",
    icon: "https://media.giphy.com/media/nBVJC12PxbYYM/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#strength-action');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-inteligence', {
    title: "Study hard, play hard and be smart!",
    text: "Your pingochi will increase the inteligence skill",
    icon: "https://media.giphy.com/media/beX1F7qtlApFu/giphy.gif",
    dangerMode: true,
    buttons: true,
  }, (value) => {
    if (value) {
      const link = document.querySelector('#inteligence-action');
      link.click();
    }
  });
});
