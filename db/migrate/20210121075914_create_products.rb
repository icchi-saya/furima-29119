class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name,        null:false
      t.text       :description,         null:false
      t.integer    :category_id,         null:false
      t.integer    :status_id,           null:false
      t.integer    :shipping_charge_id,  null:false
      t.integer    :shipping_area_id,    null:false
      t.integer    :days_ship_id,        null:false
      t.integer    :price,               null:false
      t.references :user,                null:false, foreign_key:true

      t.timestamps
    end
  end
end
