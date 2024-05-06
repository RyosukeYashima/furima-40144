class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_ship
  belongs_to :shipping_fee_burden
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_from

  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :explanation, presence: true


end
