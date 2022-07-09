class ChangeDataNameToGunres < ActiveRecord::Migration[6.1]
  def up
    change_column :gunres, :name, :string
  end

  def down
    change_column :gunres, :name, :integer
  end
end
