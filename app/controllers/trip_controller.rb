class TripController < ApplicationController
  before_action :current_user
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
  end

  def destroy
  end
end
