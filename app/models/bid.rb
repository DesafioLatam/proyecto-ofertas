class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true
  #validates :amount, :numericality => { :greater_than => 0}

  validate :consecutive, on: :create

  def consecutive
    puts 
    return if self.product.nil?
    return if self.product.bids.empty?

    if self.user_id == self.product.bids.last.user_id
      errors.add(:consecutive, "cannot bid twice in consecutive") 
    end
  end

end
