class User < ApplicationRecord
  validates :company_name, presence: true, length: { maximum: 20 }
  validates :login_id, presence: true, length: { maximum: 10 }
  validates :password, presence: true, length: { maximum: 10 }
  has_secure_password
  has_many :chems
end
