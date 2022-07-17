class ChangeGunresToGenres < ActiveRecord::Migration[6.1]
  def change
    rename_table :gunres, :tgenres
  end
end
