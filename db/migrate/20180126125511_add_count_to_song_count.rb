class AddCountToSongCount < ActiveRecord::Migration[5.1]
  def change
    add_column :song_counts, :count, :integer, default: 1, null: false
  end
end
