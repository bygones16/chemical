class Dispatching < ApplicationRecord
  validates :dispatching_number,numericality: { only_integer: true, greater_than_or_equal_to: 1 }, presence: true, length: { maximum: 50 }
  validates :dispatching_person, presence: true, length: { maximum: 50 }
  belongs_to :chem
end
