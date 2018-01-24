class History < ApplicationRecord
  belongs_to :history_address
  belongs_to :user
  belongs_to :item
end
