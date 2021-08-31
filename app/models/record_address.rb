class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id

 
        
  with_options presence: true do
   validates :user_id
   validates :item_id
 end

 

 def save
  user = User.create(user_id: user_id)
  Item.create(item_id: item_id)
end
end