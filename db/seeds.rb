# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

league = League.create( name: "Super Rad Soccer League")

users = []

20.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name)
  user = User.create( name: name, email: email, password: "password", password_confirmation: "password" )
  users << user
end

# # seed db with teams and managers, users must be created first
# teams = []

# (0..9).each do |num|
#   name = Faker::Team.creature
#   manager = User.find(num)
#   team = Team.create( name: name, manager: manager )
# end
