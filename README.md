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

 - has_many :items
 - has_many :contents

## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| catch_copy         | text       | null: false                     |
| concept            | text       | null: false                     |
| user               | references | null: false , foreign_key: true |

### Association

 - belongs_to :user
 - has_many :comments

## oder テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| purchase  | text       | null: false                     |
| item      | references | null: false , foreign_key: true |
| user      | references | null: false , foreign_key: true |
| address   | text       | null: false                     |

### Association

 - belongs_to :user
 - belongs_to :item