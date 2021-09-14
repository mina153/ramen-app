# README

#テーブル設計

##users（ユーザー情報）テーブル

| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| nickname            | string  | null:false                   |
| email               | string  | null:false, uniqueness: true |
| encrypted_password  | string  | null:false                   |
| name                | string  | null:false                   |

### Association

- has_many :items
- has_many :event_users
- has_many :comments
- has_many :events, through: :event_users


##items (ラーメン情報)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| title                  | string     | null:false                   |
| explanation            | text       | null:false                   |
| prefecture_id          | integer    | null:false                   |
| city                   | string    | null:false                   |
| user                   | references | null:false,foreign_key: true |

### Association

- has_many :comments
- belongs_to :user


##comments (コメント)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| text                   | text       | null:false                   |
| item                   | references | null:false,foreign_key: true |
| user                   | references | null:false,foreign_key: true |  

### Association

- belongs_to :user
- belongs_to :item


##events (イベント情報)

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| theme                  | string     | null:false                   |
| detail                 | text       | null:false                   |
| date                   | date       | null:false                   |  
| start_at               | datetime   | null:false                   |
| finish_at              | datetime   | null:false                   |
| user                   | references | null:false,foreign_key: true |

### Association

- has_many :event_users
- has_many :users, through: :event_users



##event_users (中間)テーブル

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| user                | references | null:false,foreign_key: true |
| event               | references | null:false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :event





## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user