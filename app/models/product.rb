class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_ship

  with_options presence: true do
  validates :image, presence: true
  validates :product_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, format: { with: /\A[0-9]+\z/, message:'Half-width numbers only'}, numericality: {only_integer: true, less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  end

  with_options numericality: { other_than: 1 , message: 'selection is mandatory' } do
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :shipping_area_id
  validates :days_ship_id
  end

end