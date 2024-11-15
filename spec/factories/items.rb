FactoryBot.define do
  factory :item do
    title             { 'サンプルタイトル' }
    introduction      { 'サンプル説明' }
    price             { 5000 }
    prefecture_id { 2 }
    postage_id        { 2 }
    shopping_date_id  { 2 }
    category_id       { 2 }
    situation_id      { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
