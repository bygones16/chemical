class Chem < ApplicationRecord
  validates :chemical_name, presence: true, length: { maximum: 20}, uniqueness: { case_sensitive: false, scope: :user_id }

  has_many :enterings, :dependent => :destroy
  has_many :dispatchings, :dependent => :destroy
  belongs_to :user
end
