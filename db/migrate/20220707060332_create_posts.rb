class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.bigint :user_id,     foreign_key: true
      t.bigint :category_id, foreign_key: true
      t.references :gunre,    foreign_key: true 
      t.string :title,         null: false
      t.string :post_title,    null: false
      t.text   :post_body,     null: false
      t.float :rate,           null: false, default: 0

      t.timestamps
    end
  end
end
