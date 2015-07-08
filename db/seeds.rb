# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bid.destroy_all
Product.destroy_all
User.destroy_all

user = User.create(email:"usuario@gmail.com", password:"12345678", role:1)
seller = User.create(email:"vendedor@gmail.com", password:"12345678", role:2)

100.times do |i|
  Product.create(name:"Producto #{i}", description:"generico", price:100, user:seller)
end
