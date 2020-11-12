FactoryBot.define do
  factory :user do
    nickname              {"mine"}
    email                 {"test@sample.com"}
    password              {"123qqqq"}
    password_confirmation {password}
    first_name            {"佐藤"}
    family_name           {"太郎"}
    first_name_kana       {"サトウ"}
    family_name_kana      {"タロウ"}
    birth                 {'1997-10-17'}
  end
end