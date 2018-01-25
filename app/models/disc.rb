class Disc < ApplicationRecord
	  belongs_to :item
	  has_many :songs, dependent: :delete_all
	  accepts_nested_attributes_for :songs
	  validates :disc_name, presence: true
end
