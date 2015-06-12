class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.integer :deck_id, null: false
      t.integer :right, default: 0
      t.integer :wrong, default: 0
      t.integer :card_idx, default: 0
      t.timestamps
    end
  end
end
