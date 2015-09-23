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

210.times do
  create_user("player")
end

5.times do
  create_user("referee")
end

# Create teams and add a manager to each team
10.times do
  team = Team.create!( name: Faker::Team.creature )
  players = User.joins(:profile).where(profiles: { role: 'player' }).limit(30).to_a

  2.times do
    player = players.pop
    player.team_memberships.create!(team: team, in_line_up: true, is_manager: true)
  end

  16.times do
    player = players.pop
    player.team_memberships.create!(team: team, in_line_up: true, is_manager: false)
  end

  players.each do |player|
    player.team_memberships.create!(team: team, in_line_up: false, is_manager: false)
  end
end
