class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :DaysToShip
  belongs_to :ShippingFeeBurden
  belongs_to :condition
  belongs_to :category
  belongs_to :ShippingFrom

  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
end
