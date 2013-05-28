class CallbacksController < ApplicationController

  before_filter :authenticate_user!

  def create
    send(params[:provider])
  end

  def facebook
    current_user.fb_uid = request.env['omniauth.auth'][:uid]
    current_user.fb_key = request.env['omniauth.auth'][:credentials][:token]
    current_user.save!

    puts request.env['omniauth.auth'][:credentials]
    puts current_user.fb_key.inspect

    user = FbGraph::User.new('me', access_token: current_user.fb_key).fetch

    @user = current_user
    @user.attributes = {
      name: user.name,
      bio: user.bio,
      location: user.location.name,
      birthday: user.birthday
    }
  end

end
