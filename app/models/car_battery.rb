class CarBattery < ApplicationRecord
  validates :brand, presence: true
  validates :model, presence: true
  validates :voltage, presence: true,
                      numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true,
                   numericality: { only_integer: true, greater_than: 0 }
  validates :warranty, presence: true,
                       numericality: { only_integer: true, greater_than: 0 }
end
