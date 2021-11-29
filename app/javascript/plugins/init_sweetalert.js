import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => { }) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback);
    });
  }
};

initSweetalert('#sweet-alert-slap', {
  title: "Are you sure?",
  text: "Your pingochi just got a slap!",
  icon: "https://media.giphy.com/media/ewHSMEx2TtEo8/source.gif",
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
  text: "Your pingochi will gain +20 of energy",
  icon: "https://media.giphy.com/media/Ve5J6fIqJ4TFmz6Ene/giphy-downsized-large.gif",
  dangerMode: true,
  buttons: true,
}, (value) => {
  if (value) {
    const link = document.querySelector('#feed-action');
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

export { initSweetalert };
