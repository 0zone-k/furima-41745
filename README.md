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
| user               | references | null: false, foreign_key: true |
| image              | string     | null: false                     |
| price              | string     | null: false                     |
| delivery           | string     | null: false                     |
| detail             | string     | null: false                     |


### Association

 - belongs_to :user
 - has_one :oder

## orders テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| oder      | text       | null: false                     |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |

### Association

 - has_many :users
 - belongs_to :item
 - has_one :order

## address テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| address   | text       | null: false                     |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |
| order     | references | null: false , foreign_key: true |

### Association

 - belongs_to :users
 - belongs_to :order