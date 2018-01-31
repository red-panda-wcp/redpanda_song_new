class RemoveCountFromSongCount < ActiveRecord::Migration[5.1]
  def change
    remove_column :song_counts, :count, :integer
  end
end
