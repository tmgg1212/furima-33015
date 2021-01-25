FactoryBot.define do
  factory :order_shipping_addresses do
    postal_code       {"123-4567"}
    area_id           {1}
    municipality      {"テスト"}
    address           {"テスト"}
    building_name     {"テスト"} 
    phone_number      {"11111111111"}
    token             {"tok_abcdefghijk00000000000000000"}
    user_id           {1}
    item_id           {1}
  end
end