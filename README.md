# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first name         | string | null: false |
| last name          | string | null: false |
| first name kana    | string | null: false |
| last name kana     | string | null: false |
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

## shipping address テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal code   | string | null: false |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building name | string | null: false |
| phone number  | string | null: false |

### Association

- belongs_to :users
- belongs_to :items

##  purchase history テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buyer           | references | null: false, foreign_key: true |
| purchased item  | references | null: false,  foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items