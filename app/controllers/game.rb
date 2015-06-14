
post '/games' do
  @deck = Deck.current_deck_by_id(params[:deck_id])
  @game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
  redirect "/games/#{@game.id}"
end

get '/games/:id' do
  @game = Game.current_game_by_id(params[:id])
  @user = current_user
  set_curr_card_letters_btn_types
  shuffle_answer_choices(@card.answer)
  erb :game
end

post '/games/:id/guess' do
  @game = Game.current_game_by_id(params[:id])
  @card = current_card
  if params[:selection] == @card.answer
    @messages = @game.correct_answer
    @game.save
    if @game.card_idx == (@game.deck.cards.length)
      redirect '/'
    end
  else
    @messages = @game.wrong_answer
    @game.save
  end
  set_curr_card_letters_btn_types
  shuffle_answer_choices
  erb :game
end
