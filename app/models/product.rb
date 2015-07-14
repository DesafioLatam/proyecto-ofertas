class Product < ActiveRecord::Base
  has_many :bids 
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  scope :last_10, -> {order("created_at desc").limit(10)}
  # def self.last_10
  #   Product.last(10)
  # end
  scope :products_and_bids_count, -> { Product.joins("LEFT JOIN bids ON bids.product_id = products.id").select("products.*").group("products.id, bids.product_id") }
  belongs_to :user

  def expired?
    Time.now > self.expiration_time
  end

  def expiration_time
    self.created_at + 2.hours + self.bids.size * 2.minutes
  end

end
