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
    Player.create!(name: Faker::Name.name,
                 description: "A good player")
    players = Player.all
    50.times do
      description = Faker::Lorem.sentence(5)
      players.each { |player| player.items.create!(description: description) }
    end

    users = User.all
    followers      = users[3..40]
    followed_player = players.first
    followers.each      { |follower| follower.follow!(followed_player) }
  end
end