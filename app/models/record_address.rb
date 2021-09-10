class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :house_number, :building_name, :telephone_number, :token
 
        
  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Please enter in single-byte number. Include hyphen(-)"}
   validates :area_id, numericality: { other_than: 1, message: "Select" }
   validates :municipality 
   validates :house_number 
   validates :telephone_number, format: {with: /\A\d{10,11}\z/ }
   validates :token
 end

 def save
  @record = Record.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name , telephone_number: telephone_number, record_id: @record.id)
end
end