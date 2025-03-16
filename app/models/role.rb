class Role < ApplicationRecord
  STATUSES=%w[active inactive]
  KINDS=%w[member admin user]

  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true, uniqueness: { scope: :group_id }
  validates :group_id, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :status, presence: true, inclusion: { in: STATUSES }
end
