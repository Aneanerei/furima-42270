## items  テーブル（商品情報）
| Column                | Type      | Options     | Constraints         |
| ----------------------| --------- | ----------- | ------------------- |
| name                  | string型  | null: false |                     |
| description           | text型    | null: false |                     |
| category_id           | integer型 | null: false |                     |
| condition_id          | integer型 | null: false |                     |
| shipping_fee_payer_id | integer型 | null: false |                     |
| prefecture_id         | integer型 | null: false |                     |
| shipping_schedule_id  | integer型 | null: false |                     |
| price                 | integer型 | null: false | check: 'price >= 0' |
| user                  | references| null: false | foreign_key: true  |

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
| Column               | Type       | Options   | Constraints           |
|----------------------|------------|-----------|-----------------------|
| user                 |references型|null: false| foreign_key: true     |
| item                 |references型|null: false| foreign_key: true     |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses  テーブル（発送先情報）
| Column               | Type       | Options   | Constraints         |
|----------------------|------------|-----------|---------------------|
| purchase             |references型|null: false| foreign_key: true   |
| postal_code          | string型   |null: false|                     |
| prefecture_id        | integer型  |null: false|                     |
| city                 | string型   |null: false|                     |
| street_address       | string型   |null: false|                     |
| building_name        | string型   |           |                     |
| phone_number         | string型   |null: false|                     |

### Association
- belongs_to :purchase