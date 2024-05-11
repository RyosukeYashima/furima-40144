class Address < ApplicationRecord

  belongs_to :shopping

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の数値で入力してください" }
end
