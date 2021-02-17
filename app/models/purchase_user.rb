class PurchaseUser
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :house_number, :apartment, :phone_number, :user_id, :product_id

  with_options presence: true do
    validates :prefectures_id, numericality: { other_than: 1 , message: 'selection is mandatory'} 
    validates :city
    validates :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Half-width numbers only" }
  end
  def save
    #購入情報
    purchase_records = PurchaseRecord.create(user_id: user_id,product_id: product_id)
    #住所情報
    UserAddress.create(postal_code: postal_code,prefectures_id: prefectures_id,city: city,house_number: house_number,apartment: apartment,phone_number: phone_number,purchase_record_id: purchase_records.id)
  end
end