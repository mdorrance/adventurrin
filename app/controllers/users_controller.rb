class UsersController < ApplicationController
  before_action :authorize!

  def index
    @feed = current_user.client.user_media_feed
  end
end
