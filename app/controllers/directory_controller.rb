class DirectoryController < ApplicationController

  before_filter :authenticate_user!

  def index
    current_user.update_facebook_checkin
    @users = User.all
  end

end
