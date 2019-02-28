class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # validatable :nickname, presence: true
  # validatable :email, presence: true
  # validatable :password, presence: true
  # validatable :password_confirmation, presence: true

end
