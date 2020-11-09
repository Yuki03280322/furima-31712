# furima-31712のER図

## users テーブル

| Column           | Type   | Option                   |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| password         | string | null: false, default: "" |
| email            | string | null: false, default: "" |
| first_name_kanji | string | null: false              |
| last_name_kanji  | string | null: false              |
| first_name_kana  | string | null: false              |
| last_name_kana   | string | null: false              |
| date_of_birth    | date   | null: false              |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| price         | integer    | null: false       |
| category      | string     | null: false       |
| condition     | string     | null: false       |
| postage       | string     | null: false       |
| area          | string     | null: false       |
| shipping_date | string     | null: false       |
| image         |            |                   |
| user_id       | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Column   | Type       | Option            |
| -------- | ---------- | ----------------- |
| buy_date | datetime   | null: false       |
| user_id  | references | foreign_key: true |
| item_id  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresss テーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | integer    | null: false       |
| prefectures      | string     | null: false       |
| city             | string     | null: false       |
| street_number    | string     | null: false       |
| building_name    | string     |                   |
| telephone        | integer    | null: false       |
| buy_id           | references | foreign_key: true |

### Association
- belongs_to :buy
