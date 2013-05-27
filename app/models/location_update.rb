class LocationUpdate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :latitude, :longitude
end
