# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first name      | string | null: false |
| last name       | string | null: false |
| first name kana | string | null: false |
| last name kana  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_one :shipping address

## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| name      | string | null: false |
| prise     | string | null: false |
| category  | string | null: false |
| condition | string | null: false |
| charges   | string | null: false |
| area      | string | null: false |
| schedule  | string | null: false |

### Association

- has_many :users
- has_one :shipping address

## shipping address テーブル

| Column        | Type       | Options |
| ------------- | ---------- | ------- |
| postal code   | string     |         |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building name | string | null: false |
| phone number  | string | null: false |

### Association

- belongs_to :users
- belongs_to :items