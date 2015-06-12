class Card < ActiveRecord::Base
  belongs_to :default_deck
  belongs_to :personal_deck
end
