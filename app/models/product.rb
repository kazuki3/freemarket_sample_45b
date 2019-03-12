class Product < ApplicationRecord
  enum condition: {}
  enum shipping_method: {}
  enum postage: {}
  enum region: {}
  enum date: {}
  belongs_to :user
  belongs_to :category
  has_many :images
end
