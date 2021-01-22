require 'rails_helper'
RSpec.describe OrderShippingAddresses, type: :model do
  before do
    @ordershipping_addresses = FactoryBot.build(:order_shipping_addresses)
  end
  context '商品の購入ができるとき' do
    it 'すべての項目が記載されていれば登録できる' do
      expect(@ordershipping_addresses).to be_valid
    end
  end
  context '商品の購入ができないとき' do
    it '郵便番号が必須であること' do
      @ordershipping_addresses.postal_code = ''
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Postal_code can't be blank")
    end
    it '郵便番号にはハイフンが必要' do
      @ordershipping_addresses.postal_code = '1111111'
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Postal_code can't be blank")
    end
    it '都道府県が必須であること' do
      @ordershipping_addresses.area_id = ''
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Area_id can't be blank")
    end
    it '市区町村が必須であること' do
      @ordershipping_addresses.municipality = ''
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が必須であること' do
      @ordershipping_addresses.address = ''
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること' do
      @ordershipping_addresses.phone_number = ''
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Phone_number can't be blank")
    end
    it '電話番号はハイフンは不要' do
      @ordershipping_addresses.phone_number = '111-1111-1111'
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include('Phone_number must be other than 0')
    end
    it '電話番号は11桁必須であること' do
      @ordershipping_addresses.phone_number = '1'
      @ordershipping_addresses.valid?
      expect(@ordershipping_addresses.errors.full_messages).to include("Phone_number can't be blank")
    end
  end
end
