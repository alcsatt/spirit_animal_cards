post '/games' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  erb :game
end

post '/games/:id/guess' do
  @game = Game.find(:id)
  card = @game.deck.cards[@game.card_idx]
  if params[:selection] == card.answer
    @game.card_idx += 1
    @game.right += 1
    @messages = ["correct!"]
    @game.save
    if @game.card_idx == @game.deck.cards.length
      redirect '/'
    end
  else
    @game.wrong += 1
    @messages = ["try again you suck"]
    @game.save
  end
  redirect "/games/#{@game.id}"
end