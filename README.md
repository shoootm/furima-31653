# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birth              | date   | null: false |


### Association

has_many:items
has_many:purchases
has_many:comments



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| price               | string     | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charge_id  | integer    | null: false                    |
| area_id             | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

belongs_to:user
has_many:comments
has_one:purchase
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_charge
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
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

belongs_to:user
belongs_to:item
has_one:shipping_address

## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false,                   |
| area_id        | integer    | null: false                    |
| municipalities | string     | null: false,                   |
| address        | string     | null: false,                   |
| building       | string     |                                |
| phone_number   | integer    | null: false,                   |
| purchase       | references | null: false, foreign_key: true |


### Association

belongs_to:purchase
belongs_to_active_hash :area


