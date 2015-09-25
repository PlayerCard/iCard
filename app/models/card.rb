class Card < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  validates :player_id, presence: true
  belongs_to :game
end
