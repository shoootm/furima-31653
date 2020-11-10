# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

has_many:items
has_many:purchases
has_many:shipping_address

## items テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
| product_name   | string     | null: false                    |
| explanation    | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| area           | string     | null: false                    |
| shipping_date  | date       | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

belongs_to:user
belongs_to:shipping_address
has_one:purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belongs_to:user
belongs_to:items
has_one:shipping_address

## shipping_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to:user
belongs_to:items
belongs_to:shipping_address