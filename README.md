# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

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


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## shipping_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

