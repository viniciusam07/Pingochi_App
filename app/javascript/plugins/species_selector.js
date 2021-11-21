
const speciesSelector = () => {
  document.querySelectorAll(".species").forEach((element)=>{
    element.addEventListener("click", (event)=>{
      document.querySelectorAll(".species img").forEach((img)=>{
        img.classList.remove("selected")
      });
      event.currentTarget.querySelector("img").classList.add("selected");
      document.querySelector("#pingochi_specie").value = event.currentTarget.dataset.specie
    })

  })
}

export {speciesSelector}
