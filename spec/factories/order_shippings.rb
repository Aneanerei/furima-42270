FactoryBot.define do
  factory :order_shipping do
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: [10, 11].sample).to_s }
    token { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
  end
end