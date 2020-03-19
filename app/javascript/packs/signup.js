console.log("signup.js running...");

function getBlacklistChoices() {
  const blacklistsSelected = document.querySelectorAll('.form-option.blacklist.form-selected');
  const blacklistsArray = []
  blacklistsSelected.forEach((blacklist) => {
    blacklistsArray.push(blacklist.innerText.toLowerCase());
  });
  return blacklistsArray;
};


const btnJs = document.getElementById('btn-js');
btnJs.addEventListener('click', function(event) {
  event.preventDefault();

  const userEmail = document.getElementById('user_email').value;
  const blacklistsArray = getBlacklistChoices();
  const learningTopicsArray = ["Le Wagon"];

  console.log(userEmail);
  console.log(blacklistsArray);





});
