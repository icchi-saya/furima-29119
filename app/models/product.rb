class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActoveRecordExtensions
  belonds_to :status
  belonds_to :category
  belonds_to :shipping_charge
  belonds_to :shipping_area
  belonds_to :days_ship

  validates :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, numericality: { other_then: 1 }
end
