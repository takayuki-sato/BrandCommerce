namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # User
    admin_user = User.where({email: "admin@brandcommerce.com"})
    if !admin_user
      User.create(name: "Admin User",
                   email: "admin@brandcommerce.com",
                   password: "password",
                   password_confirmation: "password",
                   admin: true)
    end
    3.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@brandcommerce.com"
      password  = "password"
      User.create(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    # Player
    20.times do |n|
      name  = Faker::Name.name
      Player.create(
          name: name,
          description: "A good player",
          url: 'https://openclipart.org/image/300px/svg_to_png/3754/sam_uy_futbolista_(soccer_player).png'
      )
    end
    # Team
    3.times do |n|
      name  = Faker::Name.name
      Team.create(
          name: name,
          organization: "club"
      )
    end
    # Squad
    players = Player.all
    team = Team.first
    players.each do |player|
      player.squads.create(team_id: team.id)
    end
    # item
    5.times do
      description = Faker::Lorem.sentence(5)
      players.each do |player|
        player.items.create(
          team_id: player.squads[0].id,
          url: 'https://c1.staticflickr.com/1/206/493958784_4ba4ad003a_z.jpg?zz=1',
          description: description
        )
      end
    end
    # follow
    users = User.all
    followers      = users[3..40]
    followed_player = players.first
    followers.each do |follower|
      follower.follow(followed_player) unless follower.following?(followed_player)
    end
  end
end