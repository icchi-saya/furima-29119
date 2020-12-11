## users テーブル

|Column         |Type  |Options   |
| ------------- | ---- | -------- |
|nickname       |string|null:false|
|first_name     |string|null:false|
|last_name      |string|null:false|
|first_name_kana|string|null:false|
|last_name_kana |string|null:false|
|email          |string|null:false|
|password       |string|null:false|
|birthday       |string|null:false|

### Association

- has_many : products
- has_many : purchase_record

##  products テーブル

|Column         |Type      |Options   |
| ------------- | -------- | -------- |　
|image          |references|null:false|
|product_name   |string    |null:false|
|description    |string    |null:false|
|category       |string    |null:false|
|status         |string    |null:false|
|shipping_charge|string    |null:false|
|shipping_area  |string    |null:false|
|days_ship      |string    |null:false|
|price          |string    |null:false|
|user_id        |references|null:false|

### Association

- belongs_to : users
- has_one : purchase_record
- has_one : address

## purchase_record

|Column      |Type      |Options                     |
| ---------- | -------- | ---------------------------|
|user_id     |references|null:false, foreign_key:true|
|product_id  |references|null:false, foreign_key:true|
|purchase_day|references|null:false, foreign_key:true|

### Association

- belongs_to : users
- belongs_to : products

## user_address テーブル

|Column      |Type  |Options   |
| ---------- | ---- | -------- |
|postal_code |string|null:false|
|prefectures |string|null:false|
|city        |string|null:false|
|house_number|string|null:false|
|apartment   |string|null:false|

### Association

- belongs_to : products
