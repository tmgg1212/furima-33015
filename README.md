# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_one :shipping address
- has_one :purchase history

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| price        | integer | null: false |
| category_id  | integer | null: false |
| condition_id | integer | null: false |
| charges_id   | integer | null: false |
| area_id      | integer | null: false |
| schedule_id  | integer | null: false |

### Association

- has_many :users
- has_one :shipping address
- has_one :purchase history

## shipping_address テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |

### Association

- belongs_to :users
- belongs_to :items

##  purchase_history テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buyer           | references | null: false, foreign_key: true |
| purchased_item  | references | null: false,  foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items