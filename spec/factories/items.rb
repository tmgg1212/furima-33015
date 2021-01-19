FactoryBot.define do
  factory :item do
    name            { 'test' }
    price           { 500 }
    category_id     { 1 }
    condition_id    { 1 }
    charges_id      { 1 }
    area_id         { 1 }
    schedule_id     { 1 }
    explanation     { 'テスト' }
    user_id         { 'user.id' }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
