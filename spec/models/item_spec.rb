require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
    @item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
  end

  describe '商品の出品' do
    context '出品できるとき' do
      it 'nameとinformationとcategory_idとcondition_idとdelivery_cost_idとshipping_date_idとprefecture_idとpriceとuser_idが存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品できないとき' do
    it 'nameが空では出品できない'do
    @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it 'informationが空では出品できない'do
    @item.information = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
  end
  it 'category_idが1では出品できない'do
    @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'condition_idが1では出品できない'do
    @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'delivery_cost_idが1では出品できない'do
    @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'shipping_date_idが1では出品できない'do
    @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'prefecture_idが1では出品できない'do
    @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'priceが空では出品できない'do
    @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it 'priceが300円より少ない時は出品できない'do
    @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end
  it 'priceが9999999より多い時は出品できない'do
    @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end
  it 'priceが半角数字以外では出品できない'do
    @item.price = '１2345'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
  end
end
end