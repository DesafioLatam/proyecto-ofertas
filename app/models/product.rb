class Product < ActiveRecord::Base
  has_many :bids 
  validates :name, :price, presence: true
  #validates :price, numericality: { greater_than: 0 }
  scope :last_10, -> {order("created_at desc").limit(10)}
  # def self.last_10
  #   Product.last(10)
  # end
  scope :products_and_bids_count, -> { Product.joins("LEFT JOIN bids ON bids.product_id = products.id").select("products.*").group("products.id, bids.product_id") }


end
