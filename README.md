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

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| introduction       | text       | null: false                     |
| user               | references | null: false, foreign_key: true  |
| image              | string     | null: false                     |
| price              | integer    | null: false                     |
| delivery_at        | string     | null: false                     |
| postage            | string     | null: false                     |
| days               | string     | null: false                     |
| category           | string     | null: false                     |
| situation          | string     | null: false                     |



### Association

 - belongs_to :user
 - has_one :order

## orders テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |

### Association

 - has_many :users
 - belongs_to :item
 - has_one :order

## addresses テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| address   | sting      | null: false                     |
| prefecture| string     | null: false                     |
| city      | string     | null: false                     |
| banchi    | string     | null: false                     |
| apt_name  | string     |                                 |
| room_num  | string     |                                 |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |
| order     | references | null: false , foreign_key: true |

### Association

 - belongs_to :users
 - belongs_to :order