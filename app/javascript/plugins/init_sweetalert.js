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
  text: "A slap drains 10 energy units!",
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


export { initSweetalert };
