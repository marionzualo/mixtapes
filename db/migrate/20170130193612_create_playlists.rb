class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.column :uri, :string
      t.column :date, :date
      t.timestamps
    end
  end
end
