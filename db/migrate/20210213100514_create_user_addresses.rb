class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.string :postal_code,         null: false
      t.integer :prefectures_id,     null: false
      t.string :city,                null: false
      t.string :house_number,        null: false
      t.string :apartment,           default: ""
      t.string :phone_number,        null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
