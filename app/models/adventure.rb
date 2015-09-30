class Adventure < ActiveRecord::Base
  validates :location_name, :latitude, :longitude, :user_id, presence: true
  belongs_to :user
end
