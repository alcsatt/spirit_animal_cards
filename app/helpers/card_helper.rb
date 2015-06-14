def current_card
  @game.deck.cards[@game.card_idx]
end

def shuffle_answer_choices(answer=nil)
  @cards = [card_behavior_shuffle(answer), card_behavior_shuffle(answer), @card.answer ].shuffle
end

def card_behavior_shuffle(answer=nil)
  ([CardBehavior.all.shuffle] - [answer]).flatten.first.name
end