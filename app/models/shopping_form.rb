class ShoppingForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :building_name, :shipping_from_id, :municipality, :street_address, :phone_number

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の数値で入力してください" }

  def save
    return false unless valid?

    shopping = Shopping.new(user_id: user_id, item_id: item_id)
    shopping.build_address(post_code: post_code, building_name: building_name, shipping_from_id: shipping_from_id, municipality: municipality, street_address: street_address, phone_number: phone_number)
    shopping.save
  end
end
