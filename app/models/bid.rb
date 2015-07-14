class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :amount, :numericality => { :greater_than => 0}

  validate :consecutive, on: :create
  validate :expired, on: :create


  private
  def consecutive
    last_bid = Bid.where(product:self.product).last()
    return if last_bid.nil? # if no bids can't be consecutive

    if last_bid.user == self.user
      errors.add(:consecutive, "cannot bid twice in consecutive") 
    end
  end

  def expired
    if self.product.expired?
      errors.add(:expired, "cannot bid if the product is expired")  
    end
  end

end
