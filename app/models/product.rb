class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_ship

  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, numericality: { other_then: 1 }
end
