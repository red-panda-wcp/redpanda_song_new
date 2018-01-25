class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :artist_name
      t.string :item_name
      t.text :image_id
      t.integer :price
      t.string :label_name
      t.integer :stock
      t.integer :category_id
      t.date :release_date

      t.timestamps
    end
  end
end
