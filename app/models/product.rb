class Product < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
