// click action form 1

document.querySelectorAll("#card").forEach((card) => {
  card.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("img-click");
  });
});

// click action on form 2

document.querySelectorAll("#blacklist-card").forEach((card) => {
  card.addEventListener("click", (event) => {
    console.log(event)
    event.currentTarget.classList.toggle("img-click");
  });
});


// background change on scroll

function bgChanger(){
 if(this.scrollY > this.innerHeight / 1.5) {
  document.body.classList.add("bg-active");
 } else {
  document.body.classList.remove("bg-active");
 }
}

window.addEventListener("scroll", bgChanger);
