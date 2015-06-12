class Deck < ActiveRecord::Base
  has_many :games
  has_many :cards
end
