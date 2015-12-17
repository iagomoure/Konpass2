$(document).ready(function() {
  $('.js-filters').on('click',function(event){
    $('.filters-box').toggleClass('hidden');
  });

  $.ajax({
    url: window.location.href,
    data:'',
    success: handleGoogleMap,
    error:function(){
      console.log('error!');
    },
    dataType:'json'
  });

  function handleGoogleMap(data){
    var map = new google.maps.Map(document.getElementById('map'),{
    	zoom: 10,
    	center: new google.maps.LatLng(data.city.latitude, data.city.longitude),
    	MapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var locations = [];
    for (var j = 0; j < data.days; j++){
      for (var k = 0; k < data.poi[j].points.length; k++){
        array = [];
        array.push(data.poi[j].points[k].name);
        array.push(data.poi[j].points[k].latitude);
        array.push(data.poi[j].points[k].longitude);
        array.push(k);
        locations.push(array);
      }
    }

  	// var infowindow = new google.maps.InfoWindow();
  	// var marker, i;

  	for (var i = 0; i < locations.length; i++){
  		var marker = new google.maps.Marker({
  			position: new google.maps.LatLng(locations[i][1],locations[i][2]),
  			map: map
  		});

  		// google.maps.event.addListener(marker, 'click', (function(marker,i){
  		// 	return function(){
  		// 		infowindow.setContent(locations[i][0]);
  		// 		infowindow.open(map,marker);
  		// 	}
  		// })(marker,i));

      if(markersArray === undefined){
        var markersArray = [];
      }
      markersArray.push(marker);
  	}

    drawPath(map, markersArray);
  }
});

function drawPath(map, markersArray){
  // Instantiate a direction service.
  var directionsService = new google.maps.DirectionsService;

  // Create a render for directions and bind it to the map.
  var directionsDisplay = new google.maps.DirectionsRenderer({ map: map });

  // Instantiate an info window to hold step text.
  var stepDisplay = new google.maps.InfoWindow;

  // Display the route between the initial start and end lists.
  calculateAndDisplayRoute(directionsDisplay, directionsService, markersArray, stepDisplay, map);
}

function calculateAndDisplayRoute(directionsDisplay, directionsService, markersArray, stepDisplay, map){
  // Retrieve the start and end locations and create a DirectionsRequest using WALKING directions.
  var waypoints = [];
  markersArray.forEach(function(point){
    var lat = point.position.lat();
    var lng = point.position.lng();
    waypoints.push({
      location: new google.maps.LatLng(lat, lng)
    });
  });

  var firstMarker = markersArray[0];
  var lastMarker = markersArray[markersArray.length - 1];
  var origin = firstMarker.position.lat() + "," + firstMarker.position.lng();
  var destination = lastMarker.position.lat() + "," + lastMarker.position.lng();

  directionsService.route({
    origin: origin,
    destination: destination,
    waypoints: waypoints,
    travelMode: google.maps.TravelMode.WALKING
  }, function(response, status){
    // Route the directions and pass the response to a function to create markers for each step
    if(status === google.maps.DirectionsStatus.OK){
      console.log(response.routes[0].warnings);
      directionsDisplay.setDirections(response);
    } else {
      console.error("Directions request failed due to " + status);
    }
  });
}
