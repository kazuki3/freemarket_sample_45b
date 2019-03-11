
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
* has_one :profile
* has_one :delivery_address
* has_one :payment
* has_one :point
* has_one :sale
* has_many :trades
* has_many :comments
* has_many :products
* has_many :rates
* has_many :likes

## profilesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthdate|date|null:false|
|zip_code|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|address1|string|null:false|
|address2|string|null:true|
|phone_number|string|null:true|
|user|references|null:true, foreign_key:true|

### Association
* belongs_to :user

## delivery_addressesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|zip_code|integer|null:false|
|preference|string|null:false|
|city|string|null:false|
|address1|string|null:false|
|address2|string|null:true|
|phone_number|string|null:true|
|user|references|null:true, foreign_key:true|

### Association
* belongs_to :user

## paymentsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|card_number|integer|null:false|
|expiration_date|date|null:false|
|security_code|integer|null:false|
|user|references|null:false, foreign_key:true|

### Association
* belongs_to :user

## pointsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|increase_point|integer|default:0|
|decrease_point|integer|default:0|
|user|references|null:false, foreign_key:true|

### Association
* belongs_to :user

## salesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|deposit|integer|default:0|
|user|references|null:false, foreign_key:true|

### Association
* belongs_to :user

## productsテーブル
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
|date|integer|null:false|
|seller|references|null:false, foreign_key:true|
|status|integer|default:0|

### Association
* has_one :trade
* has_one :rate
* has_many :likes
* has_many :images
* has_many :comments
* belongs_to :category
* belongs_to :size
* belongs_to :brand
* belongs_to :user, foreign_key => "seller"

## imagesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|image|string| --- |
|product|references|null:false, foreign_key:true|

### Association
* belongs_to :product

### Association
* belongs_to :product

## brandsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|

### Association
* has_many :products

## categoriesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|
|ancestry|string|index:true|

### Association
* has_many :products
* has_ancestry

## sizesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|
|product|references|foreign_key:true|

### Association
* has_many :product

## likesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_key:true|
|product|references|foreign_key:true|

### Association
* belongs_to :user
* belongs_to :product

## commentsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|comment|text|null:false|
|item|references|null:false, foreign_key:true|
|user|refenreces|null:false, foreign_key:true|

### Association
* belongs_to :user
* belongs_to :product

## ratesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|message|text|null:true|
|user|references|null:true, foreign_key:true|
|product|references|null:false, foreign_key:true|
|rate|integer|null:false|

### Association
* belongs_to :product
* belongs_to :user

## tradesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_keys:true|
|product|references|foreign_key:true|
|approve_at|date|null:true|
* ...

### Association
* belongs_to :user
* belongs_to :item
* belongs_to :product


## productsテーブル
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
|date|integer|null:false|
|seller|references|null:false, foreign_key:true|
|status|integer|default:0|

### Association
* has_one :trade
* has_one :rate
* has_many :likes
* has_many :images
* has_many :comments
* belongs_to :category
* belongs_to :size
* belongs_to :brand
* belongs_to :user, foreign_key => "seller"

## imagesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|image|string| --- |
|product|references|null:false, foreign_key:true|


### Association
* belongs_to :product

## brandsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|

### Association
* has_many :products

## categoriesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|
|ancestry|string|index:true|

### Association
* has_many :products
* has_ancestry

## sizesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|name|string|null:false|
|product|references|foreign_key:true|

### Association
* has_many :product

## likesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_key:true|
|product|references|foreign_key:true|

### Association
* belongs_to :user
* belongs_to :product

## commentsテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|comment|text|null:false|
|item|references|null:false, foreign_key:true|
|user|refenreces|null:false, foreign_key:true|

### Association
* belongs_to :user
* belongs_to :product

## ratesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|message|text|null:true|
|user|references|null:true, foreign_key:true|
|product|references|null:false, foreign_key:true|
|rate|integer|null:false|

### Association
* belongs_to :product
* belongs_to :user

## tradesテーブル
| Column | Type | Options |
|:-----------|------------:|:------------:|
|user|references|foreign_keys:true|
|product|references|foreign_key:true|
|approve_at|date|null:true|

### Association
* belongs_to :user
* belongs_to :item
* belongs_to :product
