class Player < ActiveRecord::Base
  #has_and_belongs_to_many :teams
  has_many :items, dependent: :destroy
  has_many :relationships
  has_many :users, :through => :relationships
end
