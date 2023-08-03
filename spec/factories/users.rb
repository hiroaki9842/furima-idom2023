FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {Faker::Internet.email}
    password              {'000aaa'}
    password_confirmation {password}
    kanji_first_name       {'二郎'}
    kanji_last_name       {'三田'}
    kana_first_name       {'ジロウ'}
    kana_last_name        {'ミタ'}
    birthday_yyyy_mm_dd          {'2023-07-27'}
  end
end
