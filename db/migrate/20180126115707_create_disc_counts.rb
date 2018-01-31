class CreateDiscCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :disc_counts do |t|
      t.integer :count, default: 1, null: false, limit: 1

      t.timestamps
    end
  end
end
