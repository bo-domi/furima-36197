class Item < ApplicationRecord
  has_one :record
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_price
  belongs_to :area
  belongs_to :day
end
