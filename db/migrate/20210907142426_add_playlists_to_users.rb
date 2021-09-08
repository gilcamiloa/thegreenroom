class AddPlaylistsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :youtube_playlist, :string
    add_column :users, :soundcloud_playlist, :string
  end
end
