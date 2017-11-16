Rails.application.routes.draw do
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
    # get "/one_product_url" => "products#one_product_method"
    # get "/product_all_url" => "products#product_all_method"
    # get "/first_product_url" => "products#first_product_method"
    # get "/second_product_url" => "products#second_product_method"
    # get "/third_product_url" => "products#third_product_method"
    # get "/fourth_product_url" => "products#fourth_product_method"
    # get "/fifth_product_url" => "products#fifth_product_method"
end
