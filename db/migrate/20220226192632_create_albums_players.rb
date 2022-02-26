class CreateAlbumsPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :albums_players do |t|
      t.references :player, foreign_key: false
      t.references :album, foreign_key: false
    end

    Album.where.not(player_id: nil).find_each do |album|
      album.players << Player.find(album.player_id)
    end
  end
end
