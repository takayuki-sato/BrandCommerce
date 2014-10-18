class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :player
  validates :user_id, presence: true
  validates :player_id, presence: true
end
