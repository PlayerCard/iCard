class Game < ActiveRecord::Base
  has_many :cards
  has_many :game_players
  has_and_belongs_to_many :teams
  belongs_to :referee, class_name: 'User'
end
