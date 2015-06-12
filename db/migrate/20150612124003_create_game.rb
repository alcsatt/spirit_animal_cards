class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.integer :deck_id, null: false
      t.integer :right
      t.integer :wrong
      t.timestamps
    end
  end
end
