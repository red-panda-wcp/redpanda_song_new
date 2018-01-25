class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.string :song_name
      t.integer :number

      t.timestamps
    end
  end
end
