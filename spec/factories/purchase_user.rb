FactoryBot.define do
  factory :purchase_user do
    postal_code     { "123-4567" }
    prefectures_id  { 2 }
    city            {"大阪府枚方市"}
    house_number    {"中谷3−2−1"}
    phone_number    {"09098765432"}
  end
end
