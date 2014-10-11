class Item < ActiveRecord::Base
  belongs_to :player
  validates :player_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  default_scope -> { order('created_at DESC') }
end
