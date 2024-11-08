# README

#テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |

### Association

 - has_one :item

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| catch_copy         | text       | null: false                     |
| concept            | text       | null: false                     |
| user               | references | null: false , foreign_key: true |

### Association

 - belongs_to :user



