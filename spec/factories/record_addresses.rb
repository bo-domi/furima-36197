FactoryBot.define do
  factory :record_address do

    #id                               {1}
    postal_code                      {'111-3333'}
    area_id                          {2}
    municipality                     {'横浜市緑区'}
    house_number                     {'青山1-1-1'}
    telephone_number                 {'09012345678'}
    building_name                    {'柳ビル101'}
    user_id                          {1}
    item_id                          {1}
    
  end
end
