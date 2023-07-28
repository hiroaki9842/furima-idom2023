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

| Column             | Type        | Options    |
| ------------------ | ------------| -----------|
|item_id             | integer     |null: false |
|category            | string      |null: false |
|item_name           | string      |null: false |
|item_condition      | string      |null: false |
|postage             | string      |null: false |
|sender_address      | string      |null: false |
|day_to_shipment     | string      |null: false |
|price               |integer      |null: false |
|stock               |boolean      |null: false |

###Association

-belongs_to :user
-has_one :order


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
|id                  | integer     | foreign_key: true|
|post_code           | integer     |null: false       |
|mailing_address     | string      |null: false       |
|house_number        | integer     |null: false       |
|building_name       | string      |null: false       |
|phone_number        | integer     |null: false       | 

-belongs_to :order
