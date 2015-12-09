class Feedback < ActiveRecord::Base
  belongs_to :recipient, :class_name => "User"
  belongs_to :sender, :class_name => "User"

  validates :recipient_id, presence: true
  validates :sender_id, presence: true, allow_nil: true
  validates :rating, presence: true
  validates :comment, length: { maximum: 255 }
end
