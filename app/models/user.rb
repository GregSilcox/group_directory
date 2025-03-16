class User < ApplicationRecord
  validates :email_address,
    presence: true,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
  has_many :sessions, dependent: :destroy

  # linked groups and items
  has_many :links, foreign_key: "from_id", dependent: :destroy
  has_many :phones, through: :links, source: :to, source_type: "Phone"
  # has_many :email_addresses, through: :links, source: :to, source_type: "EmailAddress"
  # has_many :addresses, through: :links, source: :to, source_type: "Address"

  has_many :roles, dependent: :destroy
  has_many :groups, through: :roles

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
