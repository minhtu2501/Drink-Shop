# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can read items"})
r2 = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})

p1 = Product.create({name: "Rayban Sunglasses", description: "Stylish shades", price: 99.99, user_id: u2.id})
p2 = Product.create({name: "Gucci watch", description: "Expensive timepiece", price: 199.99, user_id: u2.id})
p3 = Product.create({name: "Henri Lloyd Pullover", description: "Classy knitwear", price: 299.99, user_id: u3.id})
p4 = Product.create({name: "Beer", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 1})
p5 = Product.create({name: "Ice Tea", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 1})
p6 = Product.create({name: "Cream", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 2})
p7 = Product.create({name: "Number 1", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 2})
p8 = Product.create({name: "C2", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 3})
p9 = Product.create({name: "Dr. Thanh", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 3})
p10 = Product.create({name: "Nutri", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 5})
p11 = Product.create({name: "Voska", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 4})
p12 = Product.create({name: "Rum", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 4})
p13 = Product.create({name: "Wine", description: "Cosy footwear", price: 399.99, user_id: u3.id, category_id: 5})

99.times do |n|
  percent = n + 1
  Deal.create!(percent: percent)
end