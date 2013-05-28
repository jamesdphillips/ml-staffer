Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET'],
    scope: 'email,user_birthday,user_location,user_about_me,user_checkins'
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"],
    scope: "userinfo.email,userinfo.profile,plus.me,latitude.all.best,latitude.all.city,http://gdata.youtube.com"
end
