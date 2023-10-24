require 'rails_helper'

RSpec.describe BuyHistoryAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @buy_history_address = FactoryBot.build(:buy_history_address)
  end

  describe '商品の購入' do
    context '購入できるとき' do
      it 'zip_codeとprefecture_idとcityとaddressline1とtelとtokenとuser_idとitem_idが存在すれば購入できる' do
        expect(@buy_history_address).to be_valid
      end
    end
  end

  context '購入できないとき' do
    it 'zip_codeが空では出品できない'do
    @buy_history_address.zip_code = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeは3桁-4桁でないと出品できない'do
    @buy_history_address.zip_code = '1234567'
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが1では出品できない'do
    @buy_history_address.prefecture_id = '1'
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では出品できない'do
    @buy_history_address.city = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("City can't be blank")
    end
    it 'address_line1が空では出品できない'do
    @buy_history_address.address_line1 = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Address line1 can't be blank")
    end
    it 'telが空では出品できない'do
    @buy_history_address.tel = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telが10~11桁以内の半角数字以外は出品できない'do
    @buy_history_address.tel = '123456'
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Tel is invalid")
    end
    it 'tokenが空では出品できない'do
    @buy_history_address.token = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では出品できない'do
    @buy_history_address.user_id = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では出品できない'do
    @buy_history_address.item_id = ''
      @buy_history_address.valid?
      expect(@buy_history_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
