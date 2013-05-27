namespace :ml_staffer do
  task :reset_data => :environment do
    Rake::Task["db:reset"].execute

    [
      { name: "Billy He",       email: "billy@metalabdesign.com", photo_url: "photos/billy-he.jpg" },
      { name: "James Phillips", email: "james@metalabdesign.com", photo_url: "photos/connor-munro.jpg" },
      { name: "Eric Goodwin",   email: "eric@metalabdesign.com",  photo_url: "photos/eric-goodwin.jpg" },
      { name: "Connor Munro",   email: "connor@pixelunion.net",   photo_url: "photos/james-phillips.jpg" },
      { name: "Moeed Mohammad", email: "moeed@metalabdesign.com", photo_url: "photos/moeed-mohammad.jpg" }
    ].each do |data|
      user = User.create({
        name: data[:name],
        email: data[:email],
        password: "password",
        password_confirmation: "password"
      })
      user.confirm!
    end
  end
end
