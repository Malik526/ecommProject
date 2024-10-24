class Stock < ApplicationRecord
  belongs_to :product

  # Validations
  validates :size, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
