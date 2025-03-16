class Group < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :links, dependent: :destroy
  has_many :phones, through: :links
  # has_many :email_addresses, through: :links, source: :from, source_type: "EmailAddress"
  # has_many :addresses, through: :links, source: :from, source_type: "Address"
  #
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
end
