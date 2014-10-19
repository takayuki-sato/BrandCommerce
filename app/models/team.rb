class Team < ActiveRecord::Base
  has_many :squads
  has_many :players, :through => :squads
  validates_presence_of :name, :organization
end
