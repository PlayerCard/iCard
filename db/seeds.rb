require 'faker'

def create_user(role)
  name  = Faker::Name.name
  User.create!( email:                  Faker::Internet.email(name),
                password:               "password",
                password_confirmation:  "password",
                profile:                Profile.create!(
                                              name:                   name,
                                              role: role,
                                              address_1:              Faker::Address.street_address,
                                              address_2:              Faker::Address.secondary_address,
                                              city:                   Faker::Address.city,
                                              state:                  Faker::Address.state_abbr,
                                              zip:                    Faker::Address.zip
                                              )
                )
end

league = League.create( name: "Super Rad Soccer League")

# Create player for testing
# user  = User.create!( name: "Test Player",
#                       email: "test@example.com",
#                    password: "password",
#       password_confirmation: "password",
#                   address_1: Faker::Address.street_address,
#                   address_2: Faker::Address.secondary_address,
#                        city: Faker::Address.city,
#                       state: Faker::Address.state_abbr,
#                         zip: Faker::Address.zip )

210.times do
  create_user("player")
end

5.times do
  create_user("referee")
end

# Create teams and add a manager to each team
teams = []
iterator = 199

10.times do
  team = Team.create!( name: Faker::Team.creature )
  user = User.find(iterator)
  user.team_memberships.create!(team: team)
  r = user.team_memberships.first
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
    team.team_memberships.create!(user: player)
    iterator += 1
  end
end
