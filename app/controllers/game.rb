
post '/games' do
  @deck = Deck.current_deck_by_id(params[:deck_id])
  @game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  @game = Game.current_game_by_id(params[:id])
  @user = current_user
  @card = current_card
  @letters = ["a", "b", "c"]
  @cards = [([CardBehavior.all.shuffle] - [@card.answer]).flatten.first.name, ([CardBehavior.all.shuffle] - [@card.answer]).flatten.first.name, @card.answer ].shuffle
  erb :game
end

post '/games/:id/guess' do
  @game = Game.current_game_by_id(params[:id])
  @card = current_card
  if params[:selection] == @card.answer
    @game.correct_answer
    @messages = ["correct!"]
    @game.save
    if @game.card_idx == (@game.deck.cards.length)
      @messages = ["Great Job! Try another deck..."]
      redirect '/'
    end
  else
    @game.wrong_answer
    @messages = ["try again you suck"]
    @game.save
  end
  @card = current_card
  @letters = ["a", "b", "c"]
  @cards = [CardBehavior.all.shuffle.first.name, CardBehavior.all.shuffle.first.name, @card.answer ].shuffle
  erb :game
end
