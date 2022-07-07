class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      
      t.integer :user_id
      t.integer :post_id
      t.integer :reporter_id, null: false
      t.integer :reported_id, null: false
      t.text :reason, null: false
      t.text :url
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
