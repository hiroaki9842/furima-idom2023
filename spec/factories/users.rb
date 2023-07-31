FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'000aaa'}
    password_confirmation {password}
    kanji_fist_name       {'二郎'}
    kanji_last_name       {'三田'}
    kana_first_name       {'ジロウ'}
    kana_last_name        {'ミタ'}
    bithday_yyyy          {'2023'}
    bithday_mm            {'07'}
    bithday_dd            {'27'}
  end
end