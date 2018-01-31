class CreateSongCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :song_counts do |t|
      t.integer :count, default: 1, null: false

      t.timestamps
    end
  end
end
