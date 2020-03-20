console.log("signup.js running...");

function getBlacklistChoices() {
  const blacklistsSelected = document.querySelectorAll('.form-option.blacklist.form-selected');
  const blacklistsArray = []
  blacklistsSelected.forEach((blacklist) => {
    blacklistsArray.push(blacklist.innerText.toLowerCase());
  });
  return blacklistsArray;
};


const btnJavascript = document.querySelector('.btn-js');
console.log(btnJavascript);
btnJavascript.addEventListener('click', function(event) {
  console.log("Mouse clicked and function started...");
  event.preventDefault();

  const userEmail = document.getElementById('user_email').value;
  const learningTopicsArray = JSON.stringify(["Le Wagon"]);
  const blacklistsArray = JSON.stringify(getBlacklistChoices());

  console.log(userEmail);
  console.log(learningTopicsArray);
  console.log(blacklistsArray);

  // Wait 1 sec before making API call so User can be generated first!
  let endpoint = "http://localhost:3000/api/v1/blacklists/signup";
  let myInit = {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      'X-User-Email': `${userEmail}`,
      'X-User-Learning-Topics': `${learningTopicsArray}`,
      'X-User-Blacklists': `${blacklistsArray}`
    }
  };

  fetch(endpoint, myInit)
    .then(response => response.text())
    .then((data) => {
      console.log("First blacklists added to user...");
      document.location.href = "http://localhost:3000/dashboard";
    });
});


const formOptions = document.querySelectorAll('.form-option');
formOptions.forEach((formOption) => {
  formOption.addEventListener('click', function(event) {
    event.target.classList.toggle('form-selected');
  });
});

