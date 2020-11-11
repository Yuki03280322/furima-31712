FactoryBot.define do
  factory :user do
    nickname               {"テスト"}
    email                  {"test@gmail.com"}
    password               {"aaaa1111"}
    password_confirmation  {password}
    first_name_kanji       {"宮"}
    last_name_kanji        {"本"}
    first_name_kana        {"ミヤ"}
    last_name_kana         {"モト"}
    date_of_birth          {"2020-11-11"}
  end
end