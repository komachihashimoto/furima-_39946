class BuyHistory < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to :user
  belongs_to :item
  belongs_to :prefecture
  has_one :address
end
