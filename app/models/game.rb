class Game < ActiveRecord::Base
  has_many :cards
  has_and_belongs_to_many :teams
  belongs_to :user
end
