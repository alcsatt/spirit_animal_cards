class Card < ActiveRecord::Base
  belongs_to :default_deck, foreign_key: "deck_id"
  belongs_to :personal_decks, foreign_key: "deck_id"
end
