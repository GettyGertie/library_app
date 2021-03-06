class Book < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)  }
  enum bookstatus: { available: 0, unavailable: 1 }
  enum whereabouts: { returned: 0, lost: 1, 
                        borrowed: 2, given_away: 3 }
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :author,presence: true, length: {maximum: 20}
  validates :description, presence: true, length: {maximum: 50}

  validates :category,presence: true, length: {maximum: 20}
  validates :quantity,presence: true, length: {maximum: 20}
  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
      where(['title LIKE ? or author LIKE ? or category LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
      end
end
