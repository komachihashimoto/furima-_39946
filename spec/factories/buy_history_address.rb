FactoryBot.define do
  factory :buy_history_address do
    zip_code           {'111-1111'}
    prefecture_id      {2}
    city               {'test'}
    address_line1      {'test'}
    tel                {'02345678987'}
    token              {1}
    user_id            {1}
    item_id            {1}
  end
end
