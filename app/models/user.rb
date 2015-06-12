class User < ActiveRecord::Base
  has_one :personal_deck
  has_many :games
end
