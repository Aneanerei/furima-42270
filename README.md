<!-- itemsテーブル（商品情報） -->
| Column             | Type      | Options  | Constraints         |
| ------------------ | --------- | -------- | ------------------- |
| name               | string型  | NOT NULL | ------------------- |
| description        | text型    | NOT NULL | ------------------- |
| category           | string型  | NOT NULL | ------------------- |
| condition          | string型  | NOT NULL | ------------------- |
| shipping_fee_payer | string型  | NOT NULL | ------------------- |
| shipping_origin    | string型  | NOT NULL | ------------------- |
| shipping_schedule  | string型  | NOT NULL | ------------------- |
| price              | integer型 | NOT NULL | check: 'price >= 0' |
| user_id            | integer型 | NOT NULL  | foreign_key: true  |


<!-- usersテーブル（ユーザー情報） -->
| Column             | Type      | Options   | Constraints    |
|--------------------|-----------|-----------|----------------|
| nickname           | string型  | NOT NULL  |                |
| email              | string型  | NOT NULL  | unique: true   |
| encrypted_password | string型  | NOT NULL  |                |
| last_name          | string型  | NOT NULL  |                |
| first_name         | string型  | NOT NULL  |                |
| last_name_kana     | string型  | NOT NULL  |                |
| first_name_kana    | string型  | NOT NULL  |                |
| birth_date         | date型    | NOT NULL  |                |

<!-- purchasesテーブル（購入記録） -->
| Column               | Type      | Options   | Constraints                    |
|----------------------|-----------|-----------|--------------------------------|
| user_id              | integer型 | NOT NULL  | foreign_key: true              |
| item_id              | integer型 | NOT NULL  | foreign_key: true, unique:true |
| price                | integer型 | NOT NULL  |                                |

<!-- shipping_addressesテーブル（発送先情報） -->
| Column               | Type      | Options   | Constraints        |
|----------------------|-----------|-----------|---------------------|
| user_id              | integer型 | NOT NULL  | foreign_key: true   |
| postal_code          | string型  | NOT NULL  |                     |
| prefecture           | string型  | NOT NULL  |                     |
| city                 | string型  | NOT NULL  |                     |
| address_line1        | string型  | NOT NULL  |                     |
| address_line2        | string型  |           |                     |
| phone_number         | string型  | NOT NULL  |                     |
