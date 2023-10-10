# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| dob                | date   | null: false               |



### Association
 - has_many :items
 - has_many :addresses
 - has_many :orders


## items

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| delivery_cost_id | integer    | null: false |
| price_id         | integer    | null: false |
| address_id       | references | null: false |
| user             | references | null: false |



### Association
 - has_one :orders
 - belongs_to :users
 - belongs_to :addresses


## addresses

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| zip_code      | integer    | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| address_line1 | text       | null: false |
| address_line2 | text       |             |
| tel           | integer    | null: false |
| user          | references | null: false |


### Association
 - has_many :items
 - belongs_to :users



 ## buy_history

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| items  | references | null: false |


### Association
 - belongs_to :users
 - belongs_to :items