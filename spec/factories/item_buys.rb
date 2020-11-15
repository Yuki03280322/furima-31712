FactoryBot.define do
  factory :item_buy do
    token { 'test' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { 'テスト市' }
    street_number { 'テスト番地1-1-1' }
    telephone { '12345678901' }
  end
end
