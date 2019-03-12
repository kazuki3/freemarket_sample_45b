class Product < ApplicationRecord
<<<<<<< HEAD
  enum condition: {}
  enum shipping_method: {}
  enum postage: {}
  enum region: {}
  enum date: {}
  belongs_to :user
  belongs_to :category
  has_many :images
=======

  belongs_to :user
  belongs_to :category
  has_many :images

>>>>>>> kazuki3/master
end
