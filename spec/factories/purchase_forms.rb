FactoryBot.define do
  factory :purchase_form do
    postal_code         {"111-1111"}
    area_id             {"2"}
    municipalities      {"福岡市"}
    address             {"青山1-1"}
    building            {"マンション"}
    phone_number        {"12345678912"}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
