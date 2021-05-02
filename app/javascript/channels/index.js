// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)



// const searchPhoto = (event) => {
  const result = document.querySelector("#selection");
  console.log(result);

  // fetch(`db/migrate/seeds.rb/${event.currentTarget.value}`)
  //   .then(response => response.json())
  //   .then((data) => {
  //     console.log(data);
  //     results.innerHTML = '';

  // var x = document.getElementById("mySelect").value;
  // document.getElementById("demo").innerHTML = "You selected: " + x;


      // const photo = event.currentTarget.value.poster_url
      const photo = result.value.poster_url

      // data.words.forEach((word) => {
        result.insertAdjacentHTML("beforeend", `<li>${photo}</li>`);
      // });
    // });
// };

// const input = document.querySelector("#selection");
// input.addEventListener("change", searchPhoto);
