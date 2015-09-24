class Profile < ActiveRecord::Base
  belongs_to :user
  validates :role, presence: true
  has_attached_file :picture, styles: {
    large: "500x500#{}",
    medium: "300x300#{}",
    thumb: "100x100#{}"
  }, default_url: "https://s3.amazonaws.com/icardbucket/profiles/pictures/default/default_:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
