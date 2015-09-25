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

def create_game
  ref = Profile.where(role: 'referee').first.user
  Game.create(game_time: DateTime.now, game_location: Faker::Address.city, referee_id: ref.id, teams: Team.all.sample(2))
end

league = League.create( name: "Super Rad Soccer League")

User.create!( email:                  "admin@league.org",
              password:               "password",
              password_confirmation:  "password",
              profile:                Profile.create!(
                                            name:                   "Super Rad Soccer",
                                            role: "admin",
                                            address_1:              Faker::Address.street_address,
                                            address_2:              Faker::Address.secondary_address,
                                            city:                   Faker::Address.city,
                                            state:                  Faker::Address.state_abbr,
                                            zip:                    Faker::Address.zip
                                            )
              )

210.times do
  create_user("player")
end

5.times do
  create_user("referee")
end

# Create teams and add a manager to each team
10.times do
  team = Team.create!( name: 'The ' + Faker::Team.creature.capitalize )
  players = User.joins(:profile).where(profiles: { role: 'player' }).to_a.sample(30)

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

5.times do
  create_game
end
