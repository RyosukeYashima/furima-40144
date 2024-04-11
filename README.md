##　users　テーブル
| Column              | Type   | Options                |
| ---------           | ------ | ---------------------- |
| id                  | bigint | null: false, primary key |
| nickname            | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| birthday            | date   | null: false              |
| kana_first_name     | string | null: false              |
| kana_last_name      | string | null: false              |
### Association
has_many :items
has_many :shoppings

## items　テーブル
| Column                 | Type       | Options                |
| ---------              | ------     | ---------------------- |
| id                     | bigint     | null: false, primary key |
| name                   | string     | null: false              |
| price                  | integer    | null: false              |
| user                   | references | null: false,foreign_key: true  |
| explanation            | text       | null: false              |
| category_id            | integer    | null: false              |
| condition_id           | integer    | null: false              |
| shipping_fee_burden_id | integer    | null: false              |
| shipping_from_id       | integer    | null: false              |
| days_to_ship_id        | integer    | null: false              |

### Association
belongs_to :user
has_one :shopping

## shoppings テーブル
| Column              | Type       | Options                |
| ------------------- | ------     | ---------------------- |
| id                  | bigint     | null: false, primary key |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :item
has_one :address

##　addresses　テーブル
| Column          | Type   | Options                |
| --------------- | ------ | ---------------------- |
| id              | bigint | null: false, primary key |
| post_code       | string | null: false              |
| building_name   | string |                          |
| shipping_from_id| integer| null: false              |
| municipality    | string | null: false              |
| street_address  | string | null: false              |
| phone_number    | string | null: false              |
| shopping        | references | null: false, foreign key :true |
### Association
belongs_to :shopping
