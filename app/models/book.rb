class Book < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)  }
  enum status: { unavailable: false, available: true }
  enum whereabout: { returned: 0, misplaced: 1, borrowed: 2 }
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :author,presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
end
