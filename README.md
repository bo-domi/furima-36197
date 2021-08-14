# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_canat    | string | null: false               |
| first_name_canat   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| title                     | string     | null: false                    |
| text                      | text       | null: false                    |
| category_id               | integer    | null: false                    |
| detail_id                 | integer    | null: false                    |
| delivery_price_id         | integer    | null: false                    |
| area_id                   | integer    | null: false                    |
| day_id                    | integer    | null: false                    |
| price                     | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- has_one :record
- belongs_to :user

##  records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

##  addresses テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| postal_code              | string     | null: false                    |
| area_id                  | integer    | null: false                    |
| municipality             | string     | null: false                    |
| house_number             | string     | null: false                    |
| building_name            | string     |                                |
| telephone_number         | string     | null: false                    |
| record                   | references | null: false, foreign_key: true |

### Association

- belongs_to :record