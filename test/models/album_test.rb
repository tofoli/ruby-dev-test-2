require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "valid album" do
    album = Album.new(name: 'Peligro', players: [players(:shakira)])
    assert album.valid?
  end

  test "presence of name" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:name]
  end

  test "presence of player" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:players]
  end

  test "two players" do
    album = Album.new(name: 'Peligro', players: players(:shakira, :beyonce))
    assert album.valid?

    album.save
    album = album.reload

    assert_equal 2, album.players.count
    assert_equal 'Shakira', album.players.first.name
    assert_equal 'Beyonce', album.players.last.name

    shakira = Player.first
    assert_equal album.id, shakira.albums.last.id

    beyonce = Player.last
    assert_equal album.id, beyonce.albums.last.id
  end
end
