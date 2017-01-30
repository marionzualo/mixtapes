class AddIndexToUri < ActiveRecord::Migration[5.0]
  def change
    add_index :playlists, :uri
  end
end
