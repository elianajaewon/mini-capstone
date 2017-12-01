class ApplicationController < ActionController::API
  include Knock::Authenticable 

  def authenticate_admin
    if current_user && current_user.admin
      # && is a gate, checking if truthy or falsey
    else 
      render json: {error: "Not authorized."}, status: :unauthorized 
    end 
  end
end