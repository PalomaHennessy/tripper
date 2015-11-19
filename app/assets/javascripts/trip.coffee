# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initMap = ->
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -34.397
      lng: 150.644
    zoom: 8)
  return