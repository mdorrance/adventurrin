class AdventuresController < ApplicationController
  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  def new
    @adventure = Adventure.new
  end

  def create
    @adventures = Adventure.all
    @adventure = Adventure.create(adventure_params)
  end

  def edit
    @adventure = Adventure.find(params[:id])
  end

  def update
    @adventures = Adventure.all
    @adventure = Adventure.find(params[:id])

    @adventure.update_attributes(adventure_params)
  end

  def delete
    @adventure = Adventure.find(params[:adventure_id])
  end

  def destroy
    @adventures = Adventure.all
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
  end

private
  def adventure_params
    params.require(:adventure).permit(:user_id, :feed_id, :latitude, :longitude, :location_name, :location_img_url, :profile_pic_url, :profile_username, :favorite_part, :user_adventure_pic_url, :biggest_challenge, :completed)
  end
end
