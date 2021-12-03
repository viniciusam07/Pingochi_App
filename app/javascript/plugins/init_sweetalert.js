import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  console.log(swalButton)
  if (swalButton) { // protect other pages
    console.log("dentro do if")
    swalButton.addEventListener('click', () => {
      swal(options).then(callback);
    });
  }
};

export { initSweetalert };
