class Chef < ApplicationRecord
  before_save { self.email = email.downcase }

  validates_presence_of :chefname, length: {minimum:5, maximum:15}
  validates_uniqueness_of :chefname
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  has_many :recipes
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }
end
