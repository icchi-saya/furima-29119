class PurchaseUser
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :house_number, :apartment, :phone_number

  with_options presence: true do
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A[0-9０-９]+\z/, message: "Half-width numbers only" }
  end
  def save
    #住所情報
    UserAddress.create(postal_code: postal_code,prefectures_id: prefectures_id,city: city,house_number: house_number,apartment: apartment,phone_number: phone_number,purchase_record_id: purchase_record_id)
    #購入情報
    PurchaseRecored.create(user_id: user.id,product_id: product.id)
  end
end