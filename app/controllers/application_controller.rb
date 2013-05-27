class ApplicationController < ActionController::Base
  protect_from_forgery

  ::Bot.friend_updates.each do |email, status|
    user = User.where(email: email).first
    user.update_attribute(:gtalk_status, status.to_s) if user
  end
end
