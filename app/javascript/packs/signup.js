console.log("signup.js running...");

function getBlacklistChoices() {
  const blacklistsSelected = document.querySelectorAll('.form-option.blacklist.form-selected');
  const blacklistsArray = []
  blacklistsSelected.forEach((blacklist) => {
    blacklistsArray.push(blacklist.innerText.toLowerCase());
  });
  return blacklistsArray;
};


const btnJavascript = document.getElementById('btn-js');
btnJavascript.addEventListener('click', function(event) {
  event.preventDefault();

  const userEmail = document.getElementById('user_email').value;
  const blacklistsArray = getBlacklistChoices();
  const learningTopicsArray = ["Le Wagon"];

  console.log(userEmail);
  console.log(blacklistsArray);


  let endpoint = "http://localhost:3000/api/v1/blacklists/signup";
  let myInit = {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'X-User-Email': `${loginEmail}`,
      'X-User-Token': `${loginReturnToken}`
    }
  };

  fetch(endpoint)
    .then(response => response.json())
    .then((data) => {
      console.log("First blacklists added to user...");
    });
});


const formOptions = document.querySelectorAll('.form-option');
formOptions.forEach((formOption) => {
  formOption.addEventListener('click', function(event) {
    event.target.classList.toggle('form-selected');
  });
});






