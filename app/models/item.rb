class Item < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  validates :player_id, presence: true
  validates :team_id, presence: true
  default_scope -> { order('created_at DESC') }
end
