# furima-31712のER図

## users テーブル

| Column             | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| encrypted_password | string | null: false, default: "" |
| email              | string | null: false, default: "" |
| first_name_kanji   | string | null: false              |
| last_name_kanji    | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| date_of_birth      | date   | null: false              |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| price            | integer    | null: false       |
| name             | text       | null: false       |
| explanation      | text       | null: false       |
| prefecture_id    | integer    | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| postage_id       | integer    | null: false       |
| area_id          | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Column   | Type       | Option            |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| city             | string     | null: false       |
| street_number    | string     | null: false       |
| building_name    | string     |                   |
| telephone        | string     | null: false       |
| buy              | references | foreign_key: true |

### Association
- belongs_to :buy
