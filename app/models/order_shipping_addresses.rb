class OrderShippingAddresses

  include ActiveModel::Model
  attr_accessor :postal_code,:area_id,:municipality,:address,:building_name,:phone_number,:order_id,:user_id,:item_id, :token
    
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true },format: { with: /\A[0-9]{11}\z/ }
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end