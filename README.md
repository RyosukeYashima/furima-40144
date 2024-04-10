##　users　テーブル
| Column              | Type   | Options                |
| ---------           | ------ | ---------------------- |
| id                  | bigint | null: false, primary key |
| nickname            | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false              |
| name                | string | null: false              |
| birthday            | date   | null: false              |
| kana                | string | null: false              |
### Association
has_many :items
has_many :shoppings

## items　テーブル
| Column              | Type   | Options                |
| ---------           | ------ | ---------------------- |
| id                  | bigint | null: false, primary key |
| name                | string | null: false              |
| categories          | string | null: false              |
| price               | integer| null: false              |
| user_id             | bigint | null: false              |
| explanation         | text   | null: false              |
| condition           | string | null: false              |
| shipping_fee_burden | string | null: false              |
| shipping_from       | string | null: false              |
| days_to_ship        | integer| null: false              |
### Association
belongs_to :user
has_one :shopping

## shoppings テーブル
| Column              | Type   | Options                |
| ------------------- | ------ | ---------------------- |
| id                  | bigint | null: false, primary key |
| user_id             | bigint | null: false, foreign key |
| item_id             | bigint | null: false, foreign key |

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
| shipping_from   | string | null: false              |
| municipality    | string | null: false              |
| street_address  | string | null: false              |
| phone_number    | string | null: false              |

### Association
belongs_to :user
