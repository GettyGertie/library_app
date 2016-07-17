class Book < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30}
  validates :author,presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
end
