class User < ApplicationRecord

  has_one :profile


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
