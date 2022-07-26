class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :url
      t.string :image_url
      t.text :item_caption, limit: 16777215

      t.timestamps
    end
  end
end
