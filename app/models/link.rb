class Link < ApplicationRecord
  # From user or group
  belongs_to :user, foreign_key: "from_id"

  # to phone, email_address, or address
  belongs_to :phone, foreign_key: "to_id"
  belongs_to :email_address, foreign_key: "to_id"
  belongs_to :address, foreign_key: "to_id"

  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
end
