# README

## usersテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|nickname|string|null:false, index: true|
|email|string|null:false, unique: true|
|password|string|null:false|
|password_confirmation|string|null:false|
|self_introduction|text|null:true|

### Association
has_one :profile
has_one :delivery_address
has_one :credit_card
has_one :point
has_one :sales
has_many :trades
has_many :comments
has_many :items
has_many :rates
has_many :likes

## profilesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|first_kanji|string|null:false|
|last_kanji|string|null:false|
|first_kana|integer|null:false|
|last_kana|integer|null:false|
|birthdate|date|null:false|
|zip_code|integer|null:false|
|preference|string|null:false|
|city|string|null:false|
|address1|string|null:false|
|address2|string|null:true|
|phone_number|integer|null:true|
|user|references|null:true, foreign_key:true|

### Association
belongs_to :user

## delivery_addressesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|zip_code|integer|null:false|
|preference|string|null:false|
|city|string|null:false|
|address1|string|null:false|
|address2|string|null:true|
|phone_number|integer|null:true|
|user|references|null:true, foreign_key:true|

### Association
belongs_to :user

## credit_cardsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|card_number|integer|null:false|
|expiration_date|date|null:false|
|security_code|integer|null:false|
|user|references|null:false, foreign_key:true|

### Association
belongs_to :user

## pointsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|increase_point|integer|default:0|
|decrease_point|integer|default:0|
|user|references|null:false, foreign_key:true|

### Association
belongs_to :user

## salesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|deposit|integer|default:0|
|user|references|null:false, foreign_key:true|

### Association
belongs_to :user

## itemsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|
|detail|text|null:false|
|price|integer|null:false|
|category|references|null:false, foreign_key:true|
|brand|references|null:true, foreign_key:true|
|size|references|null:true, foreign_key:true|
|condition|integer|null:false|
|shipping_method|integer|null:false|
|postage|integer|null:false|
|region|integer|null:false|
|shipping_date|integer|null:false|
|seller|references|null:false, foreign_key:true|
|status|integer|default:0|

### Association
has_one :trade
has_one :rate
has_many :likes
has_many :images
has_many :comments
belongs_to :category
belongs_to :size
belongs_to :brand
belongs_to :user, foreign_key => "seller"

## imagesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|image|string| --- |
|item|references|null:false, foreign_key:true|

### Association
belongs_to :item

## brandsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|brand_name|string|null:false|

### Association
has_many :items

## categoriesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|category_name|string|null:false|
|ancestry|string|index:true|

### Association
has_many :items
has_ancestry

## sizesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|category_name|string|null:false|
|item|references|foreign_key:true|

### Association
has_many :item

## likesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_key:true|
|item|references|foreign_key:true|

### Association
belongs_to :user
belongs_to :item

## commentsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|comment|text|null:false|
|item|references|null:false, foreign_key:true|
|user|refenreces|null:false, foreign_key:true|

### Association
belongs_to :user
belongs_to :item

## ratesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|message|text|null:true|
|user|references|null:true, foreign_key:true|
|item|references|null:false, foreign_key:true|
|rate|integer|null:false|

### Association
belongs_to :item
belongs_to :user

## tradesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_keys:true|
|item|references|foreign_key:true|
|deal|boolean|default:false|

### Association
belongs_to :user
belongs_to :item
