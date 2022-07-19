class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :genre_id 
      t.string :title,         null: false
      t.string :post_title,    null: false
      t.text   :post_body,     null: false
      t.float :rate,           null: false, default: 0

      t.timestamps
    end
  end
end
