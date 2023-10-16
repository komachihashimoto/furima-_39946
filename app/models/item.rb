class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image

  validates :image, :name, :information, :price, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end

