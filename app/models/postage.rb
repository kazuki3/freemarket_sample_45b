class Postage < ApplicationRecord
  has_many :shipping_methods
  has_many :products
end
