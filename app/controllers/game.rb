require 'pry'

post '/games' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  @game = Game.find(params[:id])
  @user = User.find(session[:user_id])
  @card = @game.deck.cards[@game.card_idx]
  @letters = ["a", "b", "c"]
  @cards = [CardBehavior.all.shuffle.first.name, CardBehavior.all.shuffle.first.name, @card.answer ].shuffle
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
