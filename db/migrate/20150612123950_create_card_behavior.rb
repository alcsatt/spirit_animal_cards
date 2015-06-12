class CreateCardBehavior < ActiveRecord::Migration
  def change
    create_table :card_behaviors do |t|
      t.string :name, null: false, limit: 30
      t.timestamps
    end
  end
end
