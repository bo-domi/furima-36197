class Item < ApplicationRecord
  has_one :record
  belongs_to :user
end
