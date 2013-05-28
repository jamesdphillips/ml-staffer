class ApplicationController < ActionController::Base

  before_filter :update_campfire

  protect_from_forgery

  def update_campfire
    campfire = Tinder::Campfire.new 'metalabdesign', :token => 'c2afdce2fe3596ce2e1c05d005c3f1d9659a7c6a'
    developers = campfire.find_room_by_id(529814).current_users.map(&:email_address)
    User.all.each do |user|
      if developers.include?(user.email)
        user.update_attribute(:gtalk_status, 'online')
      else
        user.update_attribute(:gtalk_status, 'offline')
      end
    end
  end

end
