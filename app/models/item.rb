class Item < ApplicationRecord
  has_many :carts
	attachment :image
end
