class Team < ActiveRecord::Base
  has_many :players, through: :roster, class_name: "User"
  has_one :roster
end
