class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_to_ship,:shipping_fee_burden,:condition,:category,:shipping_from
  belongs_to :user

  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_burden_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_from_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end
