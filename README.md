# README

#テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |      
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

 - has_many :items
 - has_many :orders

## items テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| title              | string      | null: false                     |
| introduction       | text        | null: false                     |
| user               | references  | null: false, foreign_key: true  |
| price              | integer     | null: false                     |
| delivery_at        | name        | null: false                     |
| postage            | description | null: false                     |
| days               | description | null: false                     |
| category           | name        | null: false                     |
| situation          | description | null: false                     |



### Association

 - belongs_to :user
 - has_one :order

## orders テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |

### Association

 - belongs_to :user
 - belongs_to :item

## addresses テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| address     | string     | null: false                     |
| delivery_at | name       | null: false                     |
| city        | string     | null: false                     |
| banchi      | string     | null: false                     |
| apt_name    | string     |                                 |
| tel_num     | string     | null: false                     |
| order       | references | null: false , foreign_key: true |

### Association

 - belongs_to :order