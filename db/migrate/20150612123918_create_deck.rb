class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null: false, limit: 30
      t.string :type, null: false, limit: 30
      t.timestamps
    end
  end
end
