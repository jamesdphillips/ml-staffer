class DirectoryController < ApplicationController

  before_filter :authenticate_user!

  def index
    User.all.map(&:update_facebook_checkin)
    @users = User.all
  end

end
