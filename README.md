# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| enctypted_password | string | null: false |
| firstname          | string | null: false |
| familyname         | string | null: false |
| firstname_kana     | string | null: false |
| familyname_kana    | string | null: false |
| birth              | date   | null: false |


### Association

has_many:items
has_many:purchases
has_many:comments
has_many:shipping_addresses



## items テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

belongs_to:user
belongs_to:shipping_address
has_many:has_many:comments
has_one:purchase
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :Shipping_charges
belongs_to_active_hash :area
belongs_to_active_hash :shipping_date



## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

belongs_to:user
belongs_to:item



## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| expiration       | integer    | null: false                    |
| Security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

belongs_to:user
belongs_to:item
has_one:shipping_address

Card information

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| Postal_code    | integer    | null: false,                   |
| Municipalities | string     | null: false,                   |
| address        | string     | null: false,                   |
| Building       | string     | null: false,                   |
| phone_number   | integer    | null: false,                   |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

belongs_to:user
belongs_to:item
belongs_to:shipping_address
belongs_to:purchase
belongs_to_active_hash :area


