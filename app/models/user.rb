class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :roles
  has_many :groups, through: :roles

  has_many :links, as: :from, dependent: :destroy
  has_many :phones, through: :links
  has_many :email_addresses, through: :links
  has_many :addresses, through: :links
end
