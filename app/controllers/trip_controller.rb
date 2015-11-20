require 'rest-client'

class TripController < ApplicationController
  before_action :current_user
  def index
  end

  def create
    trip= Trip.create trip_params
    @trip = trip
    redirect_to trip_new_path(trip.id)

  end

  def new
    lat = 47.6233540
    long = -122.3301120

    @client = GooglePlaces::Client.new(ENV["PLACES_KEY"])
    @spotList = @client.spots(lat, long, :types => ['food','restaurant','meal_takeaway'])

    @gmap = ENV['GOOGLE_DIR']
    @trip = Trip.find params[:id]   
  end

  def edit
  end

  def show
  end

  def update
    # this is where the ajax call is routed to
    # we will eventually generate choices with this data (yelp or places)
    puts params["lng"]
    puts params["lat"]
    redirect_to trip_new_path
  end

  def destroy
  end

  private 

  def trip_params
    params.require(:trip).permit(:start_point, :end_point, :trip_name)
  end  
end
