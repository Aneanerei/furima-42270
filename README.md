## items  テーブル（商品情報）
| Column             | Type      | Options     | Constraints         |
| ------------------ | --------- | ----------- | ------------------- |
| name               | string型  | null: false | ------------------- |
| description        | text型    | null: false | ------------------- |
| category           | string型  | null: false | ------------------- |
| condition          | string型  | null: false | ------------------- |
| shipping_fee_payer | string型  | null: false | ------------------- |
| shipping_origin    | string型  | null: false | ------------------- |
| shipping_schedule  | string型  | null: false | ------------------- |
| price              | integer型 | null: false | check: 'price >= 0' |
| user_id            | integer型 | null: false | foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase


## users  テーブル（ユーザー情報）
| Column             | Type      | Options     | Constraints    |
|--------------------|-----------|-------------|----------------|
| nickname           | string型  | null: false |                |
| email              | string型  | null: false | unique: true   |
| encrypted_password | string型  | null: false |                |
| last_name          | string型  | null: false |                |
| first_name         | string型  | null: false |                |
| last_name_kana     | string型  | null: false |                |
| first_name_kana    | string型  | null: false |                |
| birth_date         | date型    | null: false |                |

### Association
- has_many :items
- has_many :purchases


## purchases  テーブル（購入記録）
| Column               | Type      | Options   | Constraints                    |
|----------------------|-----------|-----------|--------------------------------|
| user_id              | integer型 |null: false| foreign_key: true              |
| item_id              | integer型 |null: false| foreign_key: true, unique:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses  テーブル（発送先情報）
| Column               | Type      | Options   | Constraints        |
|----------------------|-----------|-----------|---------------------|
| user_id              | integer型 |null: false| foreign_key: true   |
| postal_code          | string型  |null: false|                     |
| prefecture           | string型  |null: false|                     |
| city                 | string型  |null: false|                     |
| address_line1        | string型  |null: false|                     |
| address_line2        | string型  |           |                     |
| phone_number         | string型  |null: false|                     |

### Association
- belongs_to :purchase