class CreateCard < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :name, null: false, limit: 30
      t.text :answer, null: false, limit: 30
      t.string :image_url, null: false
      t.string :description, null: false
      t.integer :deck_id, null: false
      t.timestamps
    end
  end
end
