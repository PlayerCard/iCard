class Profile < ActiveRecord::Base
  belongs_to :user
  validates :role, presence: true
end
