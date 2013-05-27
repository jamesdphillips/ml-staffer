namespace :ml_staffer do
  task :reset_data => :environment do
    Rake::Task["db:reset"].execute

    [
      { name: "Billy He",       email: "billy@metalabdesign.com", photo_url: "photos/billy-he.jpg", role: "Developer" },
      { name: "James Phillips", email: "james@metalabdesign.com", photo_url: "photos/james-phillips.jpg", role: "Developer" },
      { name: "Eric Goodwin",   email: "eric@metalabdesign.com",  photo_url: "photos/eric-goodwin.jpg", role: "Developer" },
      { name: "Connor Munro",   email: "connor@pixelunion.net",   photo_url: "photos/connor-munro.jpg", role: "Manager" },
      { name: "Moeed Mohammad", email: "moeed@metalabdesign.com", photo_url: "photos/moeed-mohammad.jpg", role: "Designer" }
    ].each do |data|
      user = User.new({
        name: data[:name],
        email: data[:email],
        password: "password",
        password_confirmation: "password"
      })
      user.photo_url = data[:photo_url]
      user.role = data[:role]
      user.save!
      user.confirm!
    end
  end
end
