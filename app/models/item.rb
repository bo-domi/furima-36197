class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :record
  belongs_to :user
  has_many_attached :images
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_price
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :images
    validates :title
    validates :text
    validates :user
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options presence: true, numericality: { only_integer: true, other_than: 1} do
    validates :category_id
    validates :detail_id
    validates :delivery_price_id
    validates :area_id
    validates :day_id
  end
end