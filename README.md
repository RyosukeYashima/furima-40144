##　users　テーブル
| Column    | Type   | Options              |
| --------- | ------ | -------------------- |
| id        | bigint | not null, primary key|
| nickname  | string | not null             |
| email     | string | not null, unique     |
| password  | string | not null             |
| name      | string | not null             |
| birthday  | date   | not null             |
| kana      | string | not null             |

## items　テーブル
| Column              | Type   | Options              |
| ---------           | ------ | -------------------- |
| id                  | bigint | not null, primary key|
| image               | string | not null             |
| name                | string | not null             |
| categories          | string | not null             |
| price               | integer| not null             |
| user_id             | bigint | not null             |
| explanation         | text   | not null             |
| condition           | string | not null             |
| shipping_fee_burden | string  | not null            |
| shipping_from       | string  | not null            |
| days_to_ship        | integer | not null            |

## shoppings テーブル
| Column              | Type    | Options                       |
| ------------------- | ------- | ----------------------------- |
| id                  | bigint  | not null, primary key         |
| user_id             | bigint  | not null, foreign key         |
| item_id             | bigint  | not null, foreign key         |
| credit_card_number  | string  | not null                      |
| cvc                 | string  | not null                      |
| expiration_date     | string  | not null                      |


##　addresses　テーブル
| Column               | Type    | Options              |
| ---------            | ------  | -------------------- |
| id                   | bigint  | not null, primary key|
| user_id              | bigint  | not null,foreign key |
| post_code            | string  | not null             |
| building_name        | string  |                      |
| prefectures          | string  | not null             |
| municipalities       | string  | not null             |
| street_address       | string  | not null             |
| phone_number         | string  | not null             |