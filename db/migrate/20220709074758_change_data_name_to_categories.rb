class ChangeDataNameToCategories < ActiveRecord::Migration[6.1]
  def up
    change_column :categories, :name, :string
  end

  def down
    change_column :categories, :name, :integer
  end
end
