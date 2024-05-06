FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9999999) }
    explanation { Faker::Lorem.paragraph(sentence_count: 3) }
    category_id { Category.all.sample } # ActiveHash モデルの範囲内からランダムに選択
    condition_id { Condition.all.sample } # ActiveHash モデルの範囲内からランダムに選択
    shipping_fee_burden_id { ShippingFeeBurden.all.sample } # ActiveHash モデルの範囲内からランダムに選択
    shipping_from_id { ShippingFrom.all.sample } # ActiveHash モデルの範囲内からランダムに選択
    days_to_ship_id { DaysToShip.all.sample } # ActiveHash モデルの範囲内からランダムに選択
    image { Faker::Lorem.sentence }
    association :user
  end
end 