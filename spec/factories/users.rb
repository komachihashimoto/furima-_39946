FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'a1a1a1a'}
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'てすと'}
    last_name_furigana    {'テスト'}
    first_name_furigana   {'テスト'}
    dob                   {'2000-01-01'}
  end
end