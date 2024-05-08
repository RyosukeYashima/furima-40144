FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9999999) }
    explanation { Faker::Lorem.paragraph(sentence_count: 3) }
    category_id { Faker::Number.between(from: 2, to: 11) } 
    condition_id { Faker::Number.between(from: 2, to: 7) } 
    shipping_fee_burden_id { Faker::Number.between(from: 2, to: 3) } 
    shipping_from_id { Faker::Number.between(from: 2, to: 48) } 
    days_to_ship_id { Faker::Number.between(from: 2, to: 4) } 
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/shirohara.jpg'), filename: 'shirohara.jpg')
    end
  end
end 
