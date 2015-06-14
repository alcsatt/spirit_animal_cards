def set_curr_card_letters_btn_types
  @card = current_card
  @letters = @game.set_letters
  @btn_types = @game.set_btn_types
end