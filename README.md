# テーブル設計

## users テーブル

| Column                               | Type   | Options     |
| ------------------------------------ | ------ | ----------- |
| email                                | string | null: false |
| encrypted_password                   | string | null: false |
| nickname                             | string | null: false |
| name                                 | string | null: false |
| namecanat                            | string | null: false |
| birthday                             | string | null: false |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| title         | text       | null: false                    |
| text          | text       | null: false                    |
| detail        | text       | null: false                    |
| delivery      | text       | null: false                    |
| price         | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :record

##  records テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address

##  addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| record        | references | null: false, foreign_key: true |

### Association

- belongs_to :record