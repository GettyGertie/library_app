class User < ApplicationRecord 
before_save { self.email = email.downcase  }
validates :name, presence: true, length: {maximum: 20} 
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: {maximum: 51 }, 
          format: { with: EMAIL_REGEX },
          uniqueness: {case_sensitive: false}
 end 
