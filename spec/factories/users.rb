FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name { '田中' }
    last_name { '田中' }
    kana_first_name { Gimei.unique.first.katakana }
    kana_last_name { Gimei.unique.last.katakana }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end