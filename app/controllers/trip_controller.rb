require 'rest-client'

class TripController < ApplicationController
  before_action :current_user
  def index
  end

  def change
    @trip = Trip.find(params[:id])
    @destinations = Trip.find(params[:id]).destinations
  end

  def create
    user = @current_user.id
    trip = User.find(user).trips.create trip_params
    @trip = trip
    redirect_to trip_new_path(trip.id)
  end

  def pseudoupdate
    trip = Trip.find params[:id]
    trip.latlngs.create lat:params['lat'], long:params['lng']
    render :js => "window.location = '/trip/" + params[:id] + "/editdest'"
  end

  def pseudoedit
    trip = Trip.find params[:id]
    lat = trip.latlngs.last['lat']
    long =  trip.latlngs.last['long']
    @client = GooglePlaces::Client.new(ENV["PLACES_KEY"])
    @spotList = @client.spots(lat, long, :types => ['food','restaurant','meal_takeaway']) 
    @gmap = ENV['GOOGLE_DIR']
    @trip = Trip.find params[:id]
  end

  def new
    lat = 47.6233540
    long = -122.3301120

    @client = GooglePlaces::Client.new(ENV["PLACES_KEY"])
    @spotList = @client.spots(lat, long, :radius => 3219, :types => ['food','restaurant','meal_takeaway'], :exclude => ['cafe','grocery_or_supermarket','store'])
    # @spotList.sort! { |a,b| a.price_level <=> b.price_level}
    @spotList.sort! { |a,b| b.rating <=> a.rating }

    @gmap = ENV['GOOGLE_DIR']
    @trip = Trip.find params[:id]   
  end

  def edit
    trip = Trip.find params[:id]
    lat = trip.latlngs.last['lat']
    long =  trip.latlngs.last['long']
    @client = GooglePlaces::Client.new(ENV["PLACES_KEY"])
    @spotList = @client.spots(lat, long, :types => ['food','restaurant','meal_takeaway']) 
    @gmap = ENV['GOOGLE_DIR']
    @trip = Trip.find params[:id]
  end

  def statictrip
    @trip = User.find(@current_user.id).trips
  end

  def update
    trip = Trip.find params[:id]
    trip.latlngs.create lat:params['lat'], long:params['lng']
    render :js => "window.location = '/trip/" + params[:id] + "/edit'"
  end

  def destroy
    trip.find(params[:id]).delete
    redirect_to root_path
  end

  private 

  def trip_params
    params.require(:trip).permit(:start_point, :end_point, :trip_name)
  end  
end
