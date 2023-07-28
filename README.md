# Furima テーブル設計


##users

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
|nick_name           |string  |null:false                 | 
|email               |string  |null:false,,unique: true   |
|encrypted_password  |string  |null:false                 |
|kanji_first_name    |string  |null:false                 |
|kanji_last_name     |string  |null:false                 |
|kana_first_name     |string  |null:false                 |
|kana_last_name      |string  |null:false                 |
|birthday_yyyy_mm_dd |date    |null:false                 |



###Associations

-has_many :items
-has_many :orders


##items

| Column             | Type        | Options          |
| ------------------ | ------------| -----------------|
|user                |references   | foreign_key :true|
|item_category_id    |integer      |null: false       |
|item_name           | string      |null: false       |
|item_condition_id   | integer     |                  |
|day_to_shipment_id  | integer     |null: false       |
|price               | integer     |null: false       |
|shipping_cost_id    | integer     |null: false       |
|stock_id            | integer     |null: false       |

###Association

-belongs_to :user
-has_one :order
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :stock
- belongs_to_active_hash :day_to_shippment


##orders

| Column             | Type        | Options          |
| ------------------ | ------------| -----------------|
|user                |references   | foreign_key: true|
|item                |references   | foreign_key: true|

###Assosiation

-belongs_to :user
-belongs_to :item
-has_one :address

##addresses

| Column             | Type        | Options          |
| ------------------ | ------------| -----------------|
|post_code           | string      |null: false       |
|mailing_address     | string      |null: false       |
|house_number        | string      |null: false       |
|building_name       | string      |                  |
|phone_number        | string      |null: false       | 

###Association

-belongs_to :order
