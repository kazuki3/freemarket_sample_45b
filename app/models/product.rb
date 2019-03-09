class Product < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> master
  enum condition: {}
  enum shipping_method: {}
  enum postage: {}
  enum region: {}
  enum date: {}
<<<<<<< HEAD
=======
  belongs_to :user
  belongs_to :category
  has_many :images

>>>>>>> kazuki3/master
=======
>>>>>>> master

end
