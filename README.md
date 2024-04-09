##　users　テーブル
| Column    | Type   | Options              |
| --------- | ------ | -------------------- |
| id        | bigint | not null, primary key|
| name      | string | not null             |
| email     | string | not null, unique     |
| password  | string | not null             |


## items　テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| Column    | Type   | Options              |
| --------- | ------ | -------------------- |
| id        | bigint | not null, primary key|
| image     | string | not null             |
| text      | text   | not null             |
| user_id   | bigint | not null             |


##　shoppings　テーブル
| Column    | Type   | Options              |
| --------- | ------ | -------------------- |
| id        | bigint | not null, primary key|
| user_id   | bigint | not null             |
| item_id   | bigint | not null             |

##　addresses　テーブル
| Column    | Type   | Options              |
| --------- | ------ | -------------------- |
| id        | bigint | not null, primary key|
| user_id   | bigint | not null             |
| address   | text   | not null             |