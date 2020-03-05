function getRandomImage() {
var images = ['/assets/giphy.gif', '/assets/cartoon.gif', '/assets/purple.gif', '/assets/simon.gif', '/assets/mother.gif',  ];
var image = images[Math.floor(Math.random()*images.length)];

return image;
}

function displayRandomImage() {
var htmlImage = document.getElementById("randomImage");
htmlImage.src = getRandomImage();
}
displayRandomImage();

// export { openPage };
export { getRandomImage };
export { displayRandomImage };
