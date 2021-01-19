require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できるとき' do
    it 'すべての項目が記載されていれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.charges_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charges can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.charges_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Charges must be other than 0')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 0')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.schedule_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.schedule_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Schedule must be other than 0')
    end
    it '価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '半角英語だけでは登録できないこと' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格は半角英数混合では登録できないこと' do
      @item.price = 'aa12'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
