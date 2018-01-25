class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :kana_lastname, :string
    add_column :users, :kana_firstname, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :active, :integer, default: 0
  end
end
