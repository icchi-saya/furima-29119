FactoryBot.define do
  factory :product do
    association :user
    
    product_name       {"test"}
    description        {"testtest"}
    category_id        {"2"}
    status_id          {"2"}
    shipping_charge_id {"2"}
    shipping_area_id   {"2"}
    days_ship_id       {"2"}
    price              {"400"}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
