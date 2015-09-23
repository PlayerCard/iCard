require 'faker'

league = League.create( name: "Super Rad Soccer League")

# Create player for testing
user  = User.create!( name: "Test Player",
                      email: "test@example.com",
                   password: "password",
      password_confirmation: "password",
                  address_1: Faker::Address.street_address,
                  address_2: Faker::Address.secondary_address,
                       city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                        zip: Faker::Address.zip )

# Create players
players = []

200.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)
  user = User.create!(
                      email: email,
                   password: "password",
      password_confirmation: "password"
                         )
  player = Profile.create!( user: user,
                       name: name,
                  address_1: Faker::Address.street_address,
                  address_2: Faker::Address.secondary_address,
                       city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                        zip: Faker::Address.zip,
                picture_url: Faker::Avatar.image,
                       role: "player" )
  players << player
end

# # Create refs
refs = []

5.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)
  user = User.create!(
                      email: email,
                   password: "password",
      password_confirmation: "password"
                         )
  ref = Profile.create!( user: user,
                       name: name,
                  address_1: Faker::Address.street_address,
                  address_2: Faker::Address.secondary_address,
                       city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                        zip: Faker::Address.zip,
                picture_url: Faker::Avatar.image,
                       role: "referee" )
  refs << ref
end

10.times do
  Team.create!( name: Faker::Team.creature )
end
