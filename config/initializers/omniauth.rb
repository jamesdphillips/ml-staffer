Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET'],
    scope: 'email,user_birthday,user_location,user_about_me,user_checkins'
end
