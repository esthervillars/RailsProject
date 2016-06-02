# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(:name => "seed gen", :description => "seed gen product", :image_url => "http://fyf.tac-cdn.net/images/products/large/FYF-870.jpg", :colour => "red")
Product.create(:name => "bazkets", :description => "huh?", :image_url => "https://www.independentfloralnetwork.com/profiles/abloomingbasketflowersandgifts/products/fruit%20baskets/fruitbasket.jpg", :colour => "blue")
Product.create(:name => "new", :description => "yes", :image_url => "https://www.independentfloralnetwork.com/profiles/abloomingbasketflowersandgifts/products/fruit%20baskets/fruitbasket.jpg", :colour => "black")

