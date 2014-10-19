class Player < ActiveRecord::Base
  has_many :squads
  has_many :teams, :through => :squads
  has_many :items, dependent: :destroy
  has_many :relationships
  has_many :users, :through => :relationships
end
