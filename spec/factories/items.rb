FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9999999) }
    explanation { Faker::Lorem.paragraph(sentence_count: 3) }
    category_id { Faker::Number.between(from: 2, to: 11) } # 適切なカテゴリーIDを指定
    condition_id { Faker::Number.between(from: 2, to: 7) } # 適切な商品の状態IDを指定
    shipping_fee_burden_id { Faker::Number.between(from: 2, to: 3) } # 適切な配送料の負担IDを指定
    shipping_from_id { Faker::Number.between(from: 2, to: 48) } # 適切な発送元地域IDを指定
    days_to_ship_id { Faker::Number.between(from: 2, to: 4) } # 適切な発送までの日数IDを指定
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/shirohara.jpg'), filename: 'shirohara.jpg')
    end
  end
end 
