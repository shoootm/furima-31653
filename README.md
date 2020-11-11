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
has_many:shipping_addresses



## items テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| price            | integer    | null: false                    |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| shipping_charges | integer    | null: false                    |
| area             | integer    | null: false                    |
| shipping_date    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

belongs_to:user
has_many:comments
has_one:purchase
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_charges
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
| expiration       | integer    | null: false                    |
| security_code    | integer    | null: false                    |
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
| area           | integer    | null: false                    |
| municipalities | string     | null: false,                   |
| address        | string     | null: false,                   |
| building       | string     |                                |
| phone_number   | integer    | null: false,                   |
| user           | references | null: false, foreign_key: true |
| purchase       | references | null: false, foreign_key: true |


### Association

belongs_to:user
belongs_to:purchase
belongs_to_active_hash :area


