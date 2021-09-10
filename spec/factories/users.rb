FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'111aaa'}
    password_confirmation {password}
    birthday              {'1930-01-01'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_canat       {'ヤマダ'}
    first_name_canat      {'タロウ'}
  end
end