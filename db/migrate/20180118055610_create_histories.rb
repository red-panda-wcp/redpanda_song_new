class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :count
      t.integer :order_status
      t.integer :price
      t.integer :history_address_id

      t.timestamps
    end
  end
end
