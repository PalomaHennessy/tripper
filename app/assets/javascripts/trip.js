
//this is the callback for the async js in the trip new page
function initMap() {
	//creating directionsService and directionsDisplay objects to be used
	//in setting directions
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
		//draws the map
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
		directionsDisplay.setMap(map);
		//directionsDisplay.setPanel(document.getElementById('panel'));
		//(this would set a turn by turn dispaly) 
		var request = { //object to be passed into directionsService (object) .route() (function)
		  origin: $("#start").html(),
		  destination: $("#end").html(),
		  travelMode: google.maps.DirectionsTravelMode.DRIVING
		};

		//directions request and error handling
		directionsService.route(request, function (response, status) {
		  if (status == google.maps.DirectionsStatus.OK) {
		    directionsDisplay.setDirections(response);
		  }
	  });

		//create marker
	  var marker;

    //allow marker placement
		function placeMarker(location) {
		  if ( marker ) {
		    marker.setPosition(location);
		  } else {
		    marker = new google.maps.Marker({
		      position: location,
		      map: map,
		      animation: google.maps.Animation.DROP
		    });
		  }
		}
    
    //click listener to actually place marker
		google.maps.event.addListener(map, 'click', function(event) {
		  placeMarker(event.latLng);
		  var lat = marker.getPosition().lat();
		  var lng = marker.getPosition().lng();
		  var split = window.location.pathname.split("");
		  var id = null;
			var nums = [];

			//this function is in order to pull params through js
			split.forEach(function(t){
				if(Number.isInteger(parseInt(t))) {
					nums.push(t);
					id = nums.join('');
				};
			});
		  //ajax request that passes the lat long back to the server
		  $.ajax({
		  	url: "/trip/" + id + "/update",
		  	type: "GET",
		  	data: {lat, lng}
		  }).done(function(){
		  	console.log("success");
		  })
		})
}

//this is the callback for the async js in the trip new page
function initNewMap() {
	console.log("this function is running.")
	//creating directionsService and directionsDisplay objects to be used
	//in setting directions
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
		//draws the map
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
		directionsDisplay.setMap(map);
		//directionsDisplay.setPanel(document.getElementById('panel'));
		//(this would set a turn by turn dispaly) 
		var request = { //object to be passed into directionsService (object) .route() (function)
		  origin: $("#start").html(),
		  destination: $("#end").html(),
		  travelMode: google.maps.DirectionsTravelMode.DRIVING
		};

		//directions request and error handling
		directionsService.route(request, function (response, status) {
		  if (status == google.maps.DirectionsStatus.OK) {
		    directionsDisplay.setDirections(response);
		  }
	  });

		//create marker
	  var marker;

    //allow marker placement
		function placeMarker(location) {
		  if ( marker ) {
		    marker.setPosition(location);
		  } else {
		    marker = new google.maps.Marker({
		      position: location,
		      map: map,
		      animation: google.maps.Animation.DROP
		    });
		  }
		}
    
    //click listener to actually place marker
		google.maps.event.addListener(map, 'click', function(event) {
		  placeMarker(event.latLng);
		  var lat = marker.getPosition().lat();
		  var lng = marker.getPosition().lng();
		  var split = window.location.pathname.split("");
		  var id = null;
			var nums = [];

			//this function is in order to pull params through js
			split.forEach(function(t){
				if(Number.isInteger(parseInt(t))) {
					nums.push(t);
					id = nums.join('');
				};
			});
		  //ajax request that passes the lat long back to the server
		  $.ajax({
		  	url: "/trip/" + id + "/pseudoupdate",
		  	type: "GET",
		  	data: {lat, lng}
		  }).done(function(){
		  	console.log("success");
		  })
		})
}
 