FactoryBot.define do
  factory :item do
    name              {'test'}
    information       {'test'}
    category_id       {2}
    condition_id      {2}
    delivery_cost_id  {2}
    shipping_date_id  {2}
    prefecture_id     {2}
    price             {1234}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
