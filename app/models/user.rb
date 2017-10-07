class User < ApplicationRecord
  validates :company_name, presence: true, length: { maximum: 50 }
  validates :login_id, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 50 }
  has_secure_password
  has_many :chems
end
