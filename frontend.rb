require "unirest"
require "pp"

puts "Welcome to the Products App! Please select an option."
puts "[1] Show all products."
puts "[2] Create a new product."
puts "[3] Choose a product to show."
puts "[4] Choose a product to update."

input_option = gets.chomp 

if input_option == "1"
  response = Unirest.get("http://localhost:3000/products")
  products = response.body
  pp products 
elsif input_option == "2"
  params = {}
  puts "Enter a product name:"
  params["name"] = gets.chomp
  puts "Enter a product price:"
  params["price"] = gets.chomp
  puts "Enter a product image:"
  params["image"] = gets.chomp
  puts "Enter a product description:"
  params["description"] = gets.chomp 
  response = Unirest.post("http://localhost:3000/products", parameters: params)
  product = response.body 
  pp product 
elsif input_option == "3"
  puts "Please choose a recipe ID."
  product_id = gets.chomp
  response = Unirest.get("http://locathost:3000/products/#{product_id}")
  product = response.body
  pp product 
elsif input_option == "4"
  puts "Which product ID would you like to update?"
  product_id = gets.chomp
  params = {}
  puts "Enter a new product name."
  params["name"] = gets.chomp
  puts "Enter a new product price."
  params["price"] = gets.chomp
  puts "Enter a new product image."
  params["image"] = gets.chomp
  puts "Enter a new product description."
  params["description"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/products/#{product_id}", parameters: params)
  product = response.body
  pp product 
end 