class UserRecord
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_canat, :first_name_canat, :birthday, :category_id, :detail_id, :delivery_price_id, :area_id, :day_id, :price

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を半角英数字で入力してください' } 
        
  with_options presence: true do
   validates :nickname
  validates :birthday
 end

 with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）で入力してください' } do
   validates :last_name
   validates :first_name
 end
 
 with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角（カタカナ）で入力してください' } do
   validates :last_name_canat
   validates :first_name_canat
 end

 validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options presence: true, numericality: { only_integer: true, other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :detail_id
    validates :delivery_price_id
    validates :area_id
    validates :day_id
  end

 def save
  user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name, first_name: first_name, last_name_canat: last_name_canat, first_name_canat: first_name_canat, birthday: birthday)
  Item.create(category_id: category_id, detail_id: detail_id, delivery_price_id: delivery_price_id, area_id: area_id, day_id: day_id, price: price)
end
end