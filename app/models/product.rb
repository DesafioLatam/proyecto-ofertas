class Product < ActiveRecord::Base
  has_many :bids 
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
