class TripController < ApplicationController
  def index
  end

  def create
  end

  def new
    @gmap = ENV['GOOGLE_DIR']
  end

  def edit
  end

  def show
  end

  def update
    puts params["lng"]
    puts params["lat"]
    redirect_to trip_new_path
  end

  def destroy
  end
end
