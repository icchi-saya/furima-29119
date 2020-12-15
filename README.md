## users テーブル

|Column            |Type  |Options   |
| ---------------- | ---- | -------- |
|nickname          |string|null:false|
|first_name        |string|null:false|
|last_name         |string|null:false|
|first_name_kana   |string|null:false|
|last_name_kana    |string|null:false|
|email             |string|null:false|
|encrypted_password|string|null:false|
|birthday          |date |null:false|

### Association

- has_many : products
- has_many : purchase_records

##  products テーブル

|Column            |Type      |Options                    |
| ---------------- | -------- | ------------------------- |　
|product_name      |string    |null:false                 |
|description       |text      |null:false                 |
|category_id       |integer   |null:false                 |
|status_id         |integer   |null:false                 |
|shipping_charge_id|integer   |null:false                 |
|shipping_area_id  |integer   |null:false                 |
|days_ship_id      |integer   |null:false                 |
|price             |integer   |null:false                 |
|user              |references|null:false,foreign_key:true|

### Association

- belongs_to : user
- has_one : purchase_record

## purchase_record

|Column      |Type      |Options                     |
| ---------- | -------- | ---------------------------|
|user        |references|null:false, foreign_key:true|
|product     |references|null:false, foreign_key:true|

### Association

- belongs_to : user
- belongs_to : product
- has_one : user_address

## users_address テーブル

|Column         |Type      |Options                     |
| ------------- | -------- | -------------------------- |
|postal_code    |string    |null:false                  |
|prefectures_id |integer   |null:false                  |
|city           |string    |null:false                  |
|house_number   |string    |null:false                  |
|apartment      |string    |                            |
|phone_number   |string    |null:false                  |
|purchase_record|references|null:false, foreign_key:true|

### Association

- belongs_to : purchase_record
