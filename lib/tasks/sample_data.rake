namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Admin User",
                 email: "admin@brandcommerce.com",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@brandcommerce.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    20.times do |n|
      name  = Faker::Name.name
      Player.create!(
          name: name,
          description: "A good player"
      )
    end
    players = Player.all
    5.times do
      description = Faker::Lorem.sentence(5)
      players.each { |player| player.items.create!(description: description) }
    end

    users = User.all
    followers      = users[3..40]
    followed_player = players.first
    followers.each      { |follower| follower.follow!(followed_player) }
  end
end