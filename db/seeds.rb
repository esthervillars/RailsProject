# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(:name => "basket 1", :description => "nice basket", :image_url => "http://fyf.tac-cdn.net/images/products/large/FYF-870.jpg", :colour => "red", :size => "big", :price => "22.56")
Product.create(:name => "basket 2", :description => "great priced basket", :image_url => "https://www.independentfloralnetwork.com/profiles/abloomingbasketflowersandgifts/products/fruit%20baskets/fruitbasket.jpg", :colour => "blue", :size => "big", :price => "12.05")
Product.create(:name => "basket 3", :description => "stylish basket", :image_url => "https://www.independentfloralnetwork.com/profiles/abloomingbasketflowersandgifts/products/fruit%20baskets/fruitbasket.jpg", :colour => "black", :size => "big", :price => "88.99")

