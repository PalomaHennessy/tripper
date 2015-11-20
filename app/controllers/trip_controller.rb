require 'rest-client'

class TripController < ApplicationController
  def index
  end

  def create
  end

  def new
    lat = 47.6233540
    long = -122.3301120
    # PLACES_KEY = 'AIzaSyAfd2FoSveAgDTqdeShPDNCYLcarKHmDic'

    # radius is equal to 3218 because 3218 meters equals 2 miles
    placesUrl= 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location='+lat.to_s+','+long.to_s+'&radius=3218&types=restaurant&name=&key=AIzaSyAfd2FoSveAgDTqdeShPDNCYLcarKHmDic'
    @results = JSON.parse(response)["results"]
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
