class Book < ApplicationRecord
  validate :title, presence: true
  validate :author,presence: true
  validate :description, presence: true
end
