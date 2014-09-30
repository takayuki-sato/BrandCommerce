class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  validates_presence_of :name, :organization
end
