class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [ :guest, :user, :seller ]
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode
  has_many :products
  has_many :bids, through: :products
end
