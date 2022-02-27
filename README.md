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




##rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

##user_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user



##blogs（日記）テーブル

| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| dairy               | string  | null:false                   |
| content             | text    | null:false                   |
| start_time          | datetime|                              |



##chats（チャット）テーブル

| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| user_id             | integer |                              |
| room_id             | integer |                              |
| message             | string  |                              |

### Association

- belongs_to :user
- belongs_to :room



##iines（投稿(item)へのいいね機能）テーブル

| Column              | Type       | Options                      |
|---------------------|------------|------------------------------|
| item                | references | null:false, foreign_key: true|
| user                | references | null:false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user



##likes（イベント(event)へのいいね機能）テーブル

| Column              | Type       | Options                      |
|---------------------|------------|------------------------------|
| event               | references | null:false, foreign_key: true|
| user                | references | null:false, foreign_key: true|

### Association

- belongs_to :event
- belongs_to :user



##questions（イベント(event)に関する質問）テーブル

| Column              | Type      | Options                      |
|---------------------|-----------|------------------------------|
| hatena              |   text    | null:false                   |
| event               | references| null:false, foreign_key: true|
| user                | references| null:false, foreign_key: true|


### Association

-  belongs_to :event
-  belongs_to :user




##relationships（フォロー機能）テーブル

| Column              | Type      | Options                      |
|---------------------|-----------|------------------------------|
| follower_id         | integer   |                              |
| following_id        | integer   |                              |



### Association

-  belongs_to :follower
-  belongs_to :following


