class RemovePlayerFromAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_reference :albums, :player, foreign_key: true

    add_foreign_key :albums_players, :albums
    add_foreign_key :albums_players, :players
  end
end
