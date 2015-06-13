class DefaultDeck < Deck
  # Remember to create a migration!
  def self.all_decks
    DefaultDeck.all
  end
end
