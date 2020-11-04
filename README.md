# テーブル設計

## usersテーブル
| Column    | Type   | Options     |
|-----------|--------|-------------|
| password  | string | null: false |
| name      | string | null: false |
| profile   | text   | null: false |
| occupation| string | null: false |
| position  | string | null: false |

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル
| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| title     | string     | null: false                    |
| catch_copy| text       | null: false                    |
| concept   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :comments

## commentsテーブル
| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| text      | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- belongs_to :prototypes