class UsersController < ApplicationController
  before_action :authorize!

  def index
    if current_user.client.user_media_feed.map {|media| media.location}.count == 0
      @feed = current_user.client.media_popular
      @adventures = current_user.adventures.all
    else
      @feed = current_user.client.user_media_feed
      @adventures = current_user.adventures.all
    end
  end

  def location_search
    if params[:location] == ""
      redirect_to :back
      flash[:warning] = "Sorry but you need to enter a location :)"
    elsif Geocoder.coordinates(params[:location]).nil?
      redirect_to :back
      flash[:warning] = "Sorry but according to Google, that location doesn't exist. Try another one :)"
    else
      @feed = search_results(params[:location])
      @location = params[:location]
      @adventures = current_user.adventures.all
    end
  end

  private
    def search_results(params)
      lat_long = Geocoder.coordinates(params)
      location = current_user.client.location_search(lat_long[0].to_s,lat_long[1].to_s)
      location_media = current_user.client.media_search(lat_long[0].to_s,lat_long[1].to_s)
    end

end
