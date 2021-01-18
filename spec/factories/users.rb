FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { 'テスト' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birthday              { '2000-1-1' }
  end
end
