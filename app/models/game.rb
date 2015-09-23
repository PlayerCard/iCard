class Game < ActiveRecord::Base
  has_many :cards
  belongs_to :user
end
