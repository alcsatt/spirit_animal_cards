class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false, limit: 30
      t.string :type, null: false, limit: 30, default: "PersonalDeck"
      t.integer :user_id
      t.timestamps
    end
  end
end
