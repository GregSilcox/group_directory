class Phone < ApplicationRecord
  validates :number,
    presence: true,
    uniqueness: true,
    length: { is: 10 },
    format: { with: /\A[0-9]+\z/ }

  has_many :links, foreign_key: "to_id", dependent: :destroy
  has_many :users, through: :links
  # has_many :groups, through: :links
end
