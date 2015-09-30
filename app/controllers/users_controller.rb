class UsersController < ApplicationController
  before_action :authorize!

  def index
    if current_user.client.user_media_feed.map {|media| media.location}.count == 0
      @feed = current_user.client.media_popular
    else
      @feed = current_user.client.user_media_feed
      @adventures = current_user.adventures.all
    end
  end

  def location_search
    if params[:location] == ""
      redirect_to users_path
    else
      lat_long = Geocoder.coordinates(params[:location])
      location = current_user.client.location_search(lat_long[0].to_s,lat_long[1].to_s)
      location_media = current_user.client.media_search(lat_long[0].to_s,lat_long[1].to_s)

      if location_media[0].nil?
      redirect_to users_path
      else
        @feed = location_media
        @location = params[:location]
        @adventures = current_user.adventures.all
      end
    end
  end
end
