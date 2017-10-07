class Chem < ApplicationRecord
  validates :chemical_name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  has_many :enterings, :dependent => :destroy
  has_many :dispatchings, :dependent => :destroy
  belongs_to :user
end
