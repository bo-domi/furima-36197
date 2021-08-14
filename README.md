# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last  name         | string | null: false |
| first name         | string | null: false |
| last name_canat    | string | null: false |
| first name_canat   | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| title                     | text       | null: false                    |
| text                      | text       | null: false                    |
| category_id               | integer    | null: false                    |
| detail_id                 | integer    | null: false                    |
| delivery price_id         | integer    | null: false                    |
| area_id                   | integer    | null: false                    |
| day_id                    | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- has_one :record

##  records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address

##  addresses テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| postal code              | string     | null: false                    |
| Prefecture_id            | integer    | null: false                    |
| municipality             | string     | null: false                    |
| house number             | string     | null: false                    |
| building name            | string     | null: false                    |
| telephone number         | string     | null: false                    |
| item                     | references | null: false, foreign_key: true |
| record                   | references | null: false, foreign_key: true |

### Association

- belongs_to :record