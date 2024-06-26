FactoryBot.define do
  factory :shopping_form do
    post_code { "%03d-%04d" % [Faker::Number.between(from: 100, to: 999), Faker::Number.between(from: 1000, to: 9999)] }
    shipping_from_id { 2 }
    municipality { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    token{"abcdefjhihklmnopqrstuvwxyz"}
  end
end