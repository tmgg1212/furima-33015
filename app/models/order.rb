class Order < ApplicationRecord
  has_one :shipping_addresses
  belongs_to :user
  belongs_to :item
end
