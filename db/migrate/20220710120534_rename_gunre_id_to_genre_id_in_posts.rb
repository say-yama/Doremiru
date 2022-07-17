class RenameGunreIdToGenreIdInPosts < ActiveRecord::Migration[6.1]
  def up
    rename_column :posts, :gunre_id, :genre_id
  end

  def down
    rename_column :posts, :genre_id, :gunre_id
  end

end
