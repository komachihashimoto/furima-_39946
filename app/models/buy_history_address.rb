class BuyHistoryAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address_line1, :address_line2, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :address_line1, :token
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel, format: {with: /\A0\d{10,11}\z/ }
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save

    buy_history = BuyHistory.create(item_id: item_id, user_id: user_id)
    
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1, address_line2: address_line2, tel: tel, buy_history_id: buy_history.id )
  end
end