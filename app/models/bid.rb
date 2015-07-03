class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :amount, :numericality => { :greater_than => 0}
end
