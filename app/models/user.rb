class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 5}
  validates :email, presence: true, length: {maximum: 51 }

end
