class AddArtistToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :artist, :string
  end
end
