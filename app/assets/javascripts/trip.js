function initMap() {
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var mapOptions = //Sets map options
	{
		zoom: 15,
		mapTypeControl: true, //allows you to select map type eg. map or satellite
		navigationControlOptions:
		{
		  style: google.maps.NavigationControlStyle.SMALL //sets map controls size eg. zoom
		},
		mapTypeId: google.maps.MapTypeId.ROADMAP //sets type of map Options:ROADMAP, SATELLITE, HYBRID, TERRIAN
		};
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
		directionsDisplay.setMap(map);
		directionsDisplay.setPanel(document.getElementById('panel'));
		var request = {
		  origin: "Seattle, Washington",
		  destination: "San Francisco, CA",
		  travelMode: google.maps.DirectionsTravelMode.DRIVING
		};

		directionsService.route(request, function (response, status) {
		  if (status == google.maps.DirectionsStatus.OK) {
		    directionsDisplay.setDirections(response);
		  }
	  });

	  var marker;

		function placeMarker(location) {
		  if ( marker ) {
		    marker.setPosition(location);
		  } else {
		    marker = new google.maps.Marker({
		      position: location,
		      map: map
		    });
		  }
		}

		google.maps.event.addListener(map, 'click', function(event) {
		  placeMarker(event.latLng);
		  var lat = marker.getPosition().lat();
		  var lng = marker.getPosition().lng();
		  $.ajax({
		  	url: "/trip/update",
		  	type: "GET",
		  	data: {lat, lng}
		  }).done(function(){
		  	console.log("success");
		  })
		})
}
 