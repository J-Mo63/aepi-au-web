class Snap < ApplicationRecord
  has_one :user
  has_one :comment

  validates :comment, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :comment }
end
