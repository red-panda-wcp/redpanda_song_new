class History < ApplicationRecord
    # t.integer "user_id"
    # t.integer "item_id"
    # t.integer "count"
    # t.integer "order_status"
    # t.integer "price"
    # t.integer "history_address_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

  belongs_to :history_address
  belongs_to :user
  belongs_to :item

  enum order_status: { preparation: 0, in_delivery: 1, finish: 2 }
end
