class Roster < ActiveRecord::Base
  belongs_to :team
  belongs_to :player, class_name: "User"
end
