class AddNameToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :name, :string
  end
end
