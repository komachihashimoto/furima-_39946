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
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| dob                | date   | null: false               |



### Association
 - has_many :items
 - has_many :addresses
 - has_many :buy_history


## items

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| information      | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| delivery_cost_id | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| prefectures_id   | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |



### Association
 - has_one :order
 - belongs_to :user
 - belongs_to :address


## addresses

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| zip_code       | string     | null: false       |
| prefectures_id | integer    | null: false       |
| city           | string     | null: false       |
| address_line1  | string     | null: false       |
| address_line2  | string     |                   |
| tel            | string     | null: false       |
| user           | references | foreign_key: true |


### Association
 - has_many :items
 - has_many :buy_history
 - belongs_to :user



 ## buy_history

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
 - belongs_to :user
 - belongs_to :item
 - belongs_to :address