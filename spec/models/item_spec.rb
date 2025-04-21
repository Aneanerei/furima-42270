require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品ができるとき' do
    it 'すべての情報が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  describe '商品出品ができないとき' do
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが数字以外（文字列）だと出品できない' do
      @item.price = 'あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが300未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが9,999,999を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'imageが添付されていないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Image must be uploaded')
    end

    it 'category_idが1だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idが1だと出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'shipping_fee_payer_idが1だと出品できない' do
      @item.shipping_fee_payer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee payer can't be blank")
    end

    it 'prefecture_idが1だと出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'shipping_schedule_idが1だと出品できない' do
      @item.shipping_schedule_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping schedule can't be blank")
    end

    it 'userが紐づいていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
