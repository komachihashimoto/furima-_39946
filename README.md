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

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |
| dob      | date   | null: false               |



### Association
 - has_many :items
 - has_meny :addresses
 - has_many :orders


## items

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| image        | string     | null: false |
| text         | text       | null: false |
| category     | integer    | null: false |
| condition    | integer    | null: false |
| deliverycost | integer    | null: false |
| price        | integer    | null: false |
| address_id   | references | null: false |
| user_id      | references | null: false |



### Association
 - has_one :orders
 - belongs_to :users
 - belongs_to :addresses


## addresses

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| address | string     | null: false |
| user_id | references | null: false |


### Association
 - has_many :orders
 - has_many :items
 - belongs_to :users



 ## orders

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user_id    | references | null: false |
| address_id | references | null: false |
| items_id   | references | null: false |


### Association
 - belongs_to :users
 - belongs_to :addresses
 - belongs_to :items