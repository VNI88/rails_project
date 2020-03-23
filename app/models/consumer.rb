class Consumer < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 8 }

  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  validates :email,
            presence: true, length: { maximum: 260 },
            format: { with: VALID_EMAIL_FORMAT },
            uniqueness: { case_sensititve: false }

  before_save { self.email = email.downcase }
end
