class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :house_number, :building_name, :telephone_number, :record_id

 
        
  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :postal_code
   validates :area_id 
   validates :municipality 
   validates :house_number 
   validates :telephone_number 
   validates :record_id 

 end

 def save
  Record.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name , telephone_number: telephone_number, record_id: record_id)
end
end