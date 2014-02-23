function getNearby() {
      // if (!navigator.geolocation){
//         output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
//         return;
//       }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    $.ajax({
     url: "/locations/new_ajax", // removed Rails url helper
     async: false,
     type: "POST",
     data: JSON.stringify([latitude, longitude]),
     contentType: "application/json",
     success: goToEventsIndex()
    });

  }

  function goToEventsIndex() {
    window.location.replace("/events"); // removed Rails url helper
  };

  function error() {
    window.location.replace("/locations/set"); // removed Rails url helper
  };

    navigator.geolocation.getCurrentPosition(success, error)
};