class PurchaseRecord < ApplicationRecord
  belongs_to : user
  belongs_to : product
  has_one : user_address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
