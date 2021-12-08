const love = () => {
  const btn_love = document.getElementById("btn-love");

  if (btn_love) {
    const new_mating = document.getElementById("new-mating");
    const fight = document.getElementById("love");
    const create_mating_btn = document.getElementById("create-mating-btn");
    const audio_mating = document.getElementById("audio-mating");
    btn_love.addEventListener("click", () => {
      new_mating.classList.add("d-none");
      fight.classList.remove("d-none");
      btn_love.classList.add("d-none");
      audio_mating.volume = 0.5;
      audio_mating.play();
      setTimeout(() => {
        create_mating_btn.click();
      }, 10000);
    })
  }
}

export default love
