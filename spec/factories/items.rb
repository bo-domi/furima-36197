FactoryBot.define do
  factory :item do

    title                      {'aaa'}
    text                       {'bbbbbbbbb'}
    category_id                   {2}
    detail_id                     {2}
    delivery_price_id             {2}
    area_id                       {2}
    day_id                        {2}
    price                      {300}
    created_at                      {'2021-08-23 06:06:36.080398'}
    updated_at                      {'2021-08-23 06:06:36.116979'}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end