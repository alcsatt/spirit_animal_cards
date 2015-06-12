post '/games' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  erb :game
end

post '/games/:id/guess' do

end