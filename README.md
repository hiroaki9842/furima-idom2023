# Furima テーブル設計


##users

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
|nick_name           |string  |null:false,unique: true    |
|email               |string  |null:false                 |
|pass_word           |string  |null:false                 |
|kanji_first_name    |string  |null:false                 |
|kanji_last_name     |string  |null:false                 |
|kana_first_name     |string  |null:false                 |
|kana_last_name      |string  |null:false                 |
|birthday_yyyy       |string  |null:false                 |
|birthday_mm         |integer |null:false                 |
|birthday_dd         |integer |null:false                 |


###Associations

-has_many :items
-has_many :orders


##items

| Column             | Type        | Options          |
| ------------------ | ------------| -----------------|
|user_id             |integer      | foreign_key :true|
|item_category_id    | string      |null: false       |
|item_name           | string      |null: false       |
|item_condition_id   | integer     |       |
|postage             | string      |null: false       |
|sender_address      | string      |null: false       |
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
|user_id             |integer      | foreign_key: true|
|item_id             |integer      | foreign_key: true|

###Assosiation

-belongs_to :user
-belongs_to :item
-has_one :address

##addresses

| Column             | Type        | Options          |
| ------------------ | ------------| -----------------|
|                  | integer     |foreign_key: true |
|post_code           | integer     |null: false       |
|mailing_address     | string      |null: false       |
|house_number        | integer     |null: false       |
|building_name       | string      |null: false       |
|phone_number        | integer     |null: false       | 

###Association

-belongs_to :order
