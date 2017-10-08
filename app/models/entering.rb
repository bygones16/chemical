class Entering < ApplicationRecord
  validates :entering_number, numericality: { only_integer: true, greater_than_or_equal_to: 1 },presence: true, length: { maximum: 10 }
  validates :entering_person, presence: true, length: { maximum: 10 }
  belongs_to :chem

end
