# テーブル設計

## users テーブル

<<<<<<< Updated upstream
| Column                          | Type   | Options     |
| ------------------------------- | ------ | ----------- |
| email                           | string | null: false |
| encrypted_password              | string | null: false |
| name                            | string | null: false |
=======
| Column                               | Type   | Options     |
| ------------------------------------ | ------ | ----------- |
| email                                | string | null: false |
| encrypted_password                   | string | null: false |
| nickname                             | string | null: false |
| name                                 | string | null: false |
| namecanat                            | string | null: false |
| birthday                             | string | null: false |
>>>>>>> Stashed changes

### Association

- has_many :items
- has_many :records

## items テーブル

<<<<<<< Updated upstream
| Column        | Type    | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| image      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
=======
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| title         | text       | null: false                    |
| text          | text       | null: false                    |
| detail        | text       | null: false                    |
| delivery      | text       | null: false                    |
| price         | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
| text          | string     | null: false                    |
=======
| item          | references | null: false, foreign_key: true |
>>>>>>> Stashed changes
| record        | references | null: false, foreign_key: true |

### Association

- belongs_to :record