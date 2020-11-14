FactoryBot.define do
  factory :item do
    name                 { 'test' }
    explanation          { 'test' }
    category_id          { 2 }
    condition_id         { 2 }
    shipping_charge_id   { 2 }
    area_id              { 2 }
    shipping_date_id     { 2 }
    price                { '300' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
