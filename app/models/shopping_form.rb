class ShoppingForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :building_name, :shipping_from_id, :municipality, :street_address, :phone_number

  with_options presence: true do
    validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は「3桁ハイフン4桁」の形式で入力してください" }
    validates :municipality, presence: true
    validates :street_address, presence: true
    validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の数値で入力してください" }
    validates :shipping_from_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_id
    validates :user_id
  end

  def save(params,user_id)
    @shopping = Shopping.create(user_id: user_id, item_id: params[:item_id])
    Address.create(shopping_id :shopping.id,post_code: post_code, building_name: building_name, shipping_from_id: shipping_from_id, municipality: municipality, street_address: street_address, phone_number: phone_number)
  end
end
