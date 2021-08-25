class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :record
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_price
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :category
    validates :detail
    validates :delivery_price
    validates :area
    validates :day
    validates :price
    validates :user_id
  end

end