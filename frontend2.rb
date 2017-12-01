require "unirest"
require "pp"

class Frontend 
  def initialize
    @jwt = "" 
  end 

  def show_menu 
    system "clear"
    puts "Welcome to the Products App! Please select an option."
    puts "[1] Show all products."
    puts "[1.1] Search products by title."
    puts "[2] Create a new product."
    puts "[3] Choose a product to show."
    puts "[4] Choose a product to update."
    puts "[5] Choose a product to destroy."
    puts
    puts "[signup] Sign up a new user."
    puts "[login] Log in."
    puts "[logout] Log out."
    puts "[order] Create a new order."
    puts "[view] View all orders."
    puts 
    puts "[q] Quit"
  end 

  def show_all
    response = Unirest.get("http://localhost:3000/products")
    products = response.body
    pp products
  end  

  def search_product
    puts "Enter a search term."
    search_term = gets.chomp 
    puts "Here is your product:"
    response = Unirest.get("http://localhost:3000/products?search=#{search_term}")
    product = response.body 
    pp product
  end 

  def create_new
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
    if product["error"]
      puts "Try again!"
      pp product["error"]
    else 
      puts "Here's your new product:"
      pp product 
    end 
  end 

  def show_one
    puts "Please choose a recipe ID."
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/products/#{product_id}")
    product = response.body
    pp product 
  end

  def update_product
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
    if product["error"]
      puts "Try again!"
      pp product["error"]
    else 
      puts "Here is your updated product:"
      pp product 
    end
  end 

  def destroy_product
    puts "Which product ID would you like to destroy?"
    product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/products/#{product_id}")
    pp response.body
  end

  def signup_user
    params = {}
    puts "Name: "
    params[:name] = gets.chomp
    puts "Email: "
    params[:email] = gets.chomp 
    puts "Password: "
    params[:password] = gets.chomp 
    puts "Password confirmation: "
    params[:password_confirmation] = gets.chomp 
    response = Unirest.post("http://localhost:3000/users", parameters: params)
    pp response.body 
  end

  def login_user
    puts "Please log in."
    params = {}
    puts "Email: "
    params[:email] = gets.chomp
    puts "Password:"
    params[:password] = gets.chomp 
    response = Unirest.post("http://localhost:3000/user_token", parameters: {auth: {email: params[:email], password: params[:password]}})
    pp response.body 
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  end

  def logout_user
    jwt = ""
    Unirest.clear_default_headers()
  end

  def order_product
    params = {}
    puts "Enter a product id: "
    params[:product_id] = gets.chomp 
    puts "Enter a quantity: "
    params[:quantity] = gets.chomp 
    response = Unirest.post("http://localhost:3000/orders", parameters: params)
    pp response.body 
  end

  def view_orders
    response = Unirest.get("http://localhost:3000/orders")
    pp response.body 
  end 

  def quit
    puts "Goodbye!"
    exit
  end

  def run 
    while true 
      show_menu
      input_option = gets.chomp

      if input_option == "1"
        show_all
      elsif input_option == "1.1"
        search_product
      elsif input_option == "2"
        create_new
      elsif input_option == "3"
        show_one 
      elsif input_option == "4"
        update_product 
      elsif input_option == "5"
        destroy_product
      elsif input_option == "signup"
        signup_user
      elsif input_option == "login"
        login_user
      elsif input_option == "logout"
        logout_user
      elsif input_option == "order"
        order_product
      elsif input_option == "view"
        view_orders
      elsif input_option == "q"
        quit 
      end
      puts "Press enter to continue."
      gets.chomp 
    end  
  end 
end 

frontend = Frontend.new
frontend.run 