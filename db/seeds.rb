require 'faker'

league = League.create( name: "Super Rad Soccer League")

# Create player for testing
user  = User.create!( email: "test@example.com",
                   password: "password",
      password_confirmation: "password" )

# Create players
players = []

210.times do
  name  = Faker::Name.name
  email = Faker::Internet.email(name)
  user = User.create!( email: email,
                    password: "password",
       password_confirmation: "password" )
  player = Profile.create!( user: user,
                        name: name,
                   address_1: Faker::Address.street_address,
                   address_2: Faker::Address.secondary_address,
                        city: Faker::Address.city,
                       state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip,
                        role: "player" )
  players << player
end

# # Create refs
refs = []

5.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)
  user = User.create!( email: email,
                    password: "password",
       password_confirmation: "password" )
  ref = Profile.create!( user: user,
                        name: name,
                   address_1: Faker::Address.street_address,
                   address_2: Faker::Address.secondary_address,
                        city: Faker::Address.city,
                       state: Faker::Address.state_abbr,
                         zip: Faker::Address.zip,
                        role: "referee" )
  refs << ref
end

# Create teams and add a manager to each team
teams = []
iterator = 199

10.times do
  team = Team.create!( name: Faker::Team.creature )
  user = User.find(iterator)
  user.rosters.create!(team: team)
  r = user.rosters.first
  r.is_manager = true
  r.save
  teams << team
  iterator += 1
end

# Add 20 more players to each team, total 21 players on team

iterator = 1

teams.each do |team|
  20.times do
    player = User.find(iterator)
    team.rosters.create!(user: player)
    iterator += 1
  end
end
