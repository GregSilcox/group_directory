class Phone < ApplicationRecord
  validates :number, presence: true, uniqueness: true, length: { is: 10 }, format: { with: /\A[0-9]+\z/ }
end
