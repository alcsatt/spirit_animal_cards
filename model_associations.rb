User
has_one :personal_deck
has_many :games

Deck
has_many :games
has_many :cards

PersonalDeck
belongs_to :user

DefaultDeck

Card
belongs_to :default_deck
belongs_to :personal_deck

CardBehavior

Game
belongs_to :user
belongs_to :deck
