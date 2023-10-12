FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'a1a1a1a'}
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'てすと'}
    last_name_furigana    {'テスト'}
    first_name_furigana   {'テスト'}
    dob                   {'2000-01-01'}
  end
end