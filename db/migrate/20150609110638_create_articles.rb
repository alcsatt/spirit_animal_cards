class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :author, null:false
      t.integer :category_id
      t.text :description
      t.integer :price
      t.string :encryption_key

      t.timestamps null:false
    end
  end
end
