class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :book_id,       null: false
      t.integer :genre,        null: false
      t.integer :category,     null: false
      t.string :post_title,    null: false
      t.text   :post_body
      t.float :rate,           null: false, default: 0

      t.timestamps
    end
  end
end
