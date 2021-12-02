const fight = () => {
  const btn_fight = document.getElementById("btn-fight");

  if (btn_fight) {
    const new_battle = document.getElementById("new-battle");
    const fight = document.getElementById("fight");
    const create_battle_btn = document.getElementById("create-battle-btn");

    btn_fight.addEventListener("click", () => {
      new_battle.classList.add("d-none");
      fight.classList.remove("d-none");
      btn_fight.classList.add("d-none");

      setTimeout(() => {
        create_battle_btn.click();
      }, 10000);
    })
  }
}

export default fight
