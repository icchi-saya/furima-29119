FactoryBot.define do
  factory :user do
    nickname              {"test"}
    first_name            {"山田"}
    last_name             {"花子"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"ハナコ"}
    email                 {Faker::Internet.free_email}
    password              {"aaa0000"}
    password_confirmation {password}
    birthday              {"2000-01-01"}
  end
end